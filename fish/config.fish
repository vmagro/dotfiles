alias vim=nvim
set EDITOR nvim
set VISUAL nvim

fish_vi_key_bindings

set -x GOPATH $HOME/go
set PATH /usr/local/sbin $PATH
set PATH $HOME/bin $GOPATH/bin $PATH

alias :q=exit

# see comment in this file for the clowniness
source ~/.config/fish/functions/fbcode_cd.fish
# make sure it happens when fish is first launched too
fbcode_cd
