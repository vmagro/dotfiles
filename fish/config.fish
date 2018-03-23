alias vim=nvim
set EDITOR nvim
set VISUAL nvim

fish_vi_key_bindings

set -x GOPATH $HOME/go
set PATH /usr/local/sbin $PATH
set PATH $HOME/bin $GOPATH/bin $PATH

alias :q=exit
