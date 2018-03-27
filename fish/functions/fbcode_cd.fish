# this is super clowny but it coerces new tmux panes that are in fbcode to use the
# nicer symlinked path rather than the real path on disk
function fbcode_cd --on-variable PWD
  switch (pwd)
  case "/data/users/vmagro/fbsource/fbcode*"
    set -l path (string replace "/data/users/vmagro/fbsource/fbcode" "$HOME/fbcode" (pwd))
    cd $path
  end
end

