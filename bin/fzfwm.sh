#!/bin/bash
set -e

verbose=""
# verbose=TRUE

function log {
  if [[ $verbose ]]; then
    >&2 echo "$1"
  fi
}

watchlist=$(watchman watch-list | jq -r '.roots | .[]' || echo "")

function watchman_list {
  dir="$1"
  # fallback to watchman
  for root in $watchlist; do
    if [[ $dir == $root* ]]; then
      if [[ "$dir" == "$root" ]]; then
        relative="/"
      else
        relative=${dir#$root/}
      fi;
      log "using watchman root = $root, relative = $relative"
      # watchman with relative_root and no other query generator will only show us files under that root and helpfully remove the prefix
      echo '["query", "'"$root"'", {"relative_root": "'"$relative"'", "fields": ["name"]}]' | watchman -j | jq -r '.files | .[]'
      log "returning 0"
      return 0;
    fi
  done
  log "not in watchman root"
  return 1
}

function list_dir {
  pushd "$1" > /dev/null
  dir=$(realpath $(pwd))
  log "listing files in $dir"
  # if we're in an hg repo we can be faster
  if root=$(hg root 2> /dev/null); then
    if [[ "$dir" == "$root" ]]; then
      log "in root of hg"
      relative=""
    else
      relative=${dir#$root/}/
      log "in an hg repo: root = $root, relative path = $relative"
    fi
    # try myles first
    if command -v myles > /dev/null; then
      log "using myles"
      # with the release version of myles, we have to use json to not mess around with relative paths
      myles --list --limit 1000000 --query "$relative" --json | jq -r '.results | .[] | .path' | grep -oP "^$relative\K.*"
      # with my fixes myles will output relative paths correctly
      # myles --list --limit 10000 --query "$relative" | sed "s/^.*'${relative//\//\\/}'\(.*\)/\1/"
      # myles --list --limit 10000 --query "$relative" | sed 's/^.*fbcode\/kernel\/\(.*\)/\1/'
      popd > /dev/null
      return
    fi
    # use watchman before hg files
    if watchman_list "$dir"; then
      popd > /dev/null
      return
    fi
    # fallback to hg files (tee to prevent paging)
    log "using hg files"
    hg files . | tee
    popd > /dev/null
    return
  fi
  if watchman_list "dir"; then
    log "used watchman"
    popd > /dev/null
    return
  fi
  # if we are in a git repo git ls-files will print all the files relative to where we are now
  # -cmo to include all files that we want to see
  if git ls-files -co 2> /dev/null; then
    log "used git ls-files"
    popd > /dev/null
    return
  fi
  # if we get here we have to resort to 'find .' which will just walk the entire directory
  log "falling back to recursive with find ."
  find . -maxdepth 1 -mindepth 1 -type f -printf '%f\n'
  find . -maxdepth 1 -mindepth 1 -type d | while read -r file; do
    list_dir "$file"
  done
  popd > /dev/null
}

list_dir "$(pwd)"
