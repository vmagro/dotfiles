# this is super clowny but it coerces new tmux panes that are in fbcode to use the
# nicer symlinked path rather than the real path on disk
function fbcode_cd --on-variable PWD
  switch (pwd)
  case "/data/users/vmagro/fbsource/fbcode*"
    set -l path (string replace "/data/users/vmagro/fbsource/fbcode" "$HOME/fbcode" (pwd))
    cd $path
  case "/data/users/vmagro/configerator-hg*"
    set -l path (string replace "/data/users/vmagro/configerator-hg" "$HOME/configerator" (pwd))
    cd $path
  case "/data/users/vmagro/www-hg*"
    set -l path (string replace "/data/users/vmagro/www-hg" "$HOME/www" (pwd))
    cd $path
  case "/data/users/vmagro/opsfiles-hg*"
    set -l path (string replace "/data/users/vmagro/opsfiles-hg" "$HOME/opsfiles" (pwd))
    cd $path
  case "/data/users/vmagro/*"
    set -l path (string replace "/data/users/vmagro" "$HOME" (pwd))
    cd $path
  end
end

