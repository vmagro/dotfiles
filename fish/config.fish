alias vim=nvim
set EDITOR nvim
set VISUAL nvim

fish_vi_key_bindings

set -x GOPATH $HOME/go
set PATH /usr/local/sbin $PATH
set PATH $HOME/bin $PATH

alias :q=exit

# golang at fb
set -x GOPATH /data/users/$USER/gopaths/gothrift /data/users/$USER/gopaths/godeps /data/users/$USER/gopaths/gofbcode
set -x GOROOT /data/users/$USER/gopaths/goroot
set PATH /data/users/$USER/fbsource/fbcode/third-party-buck/gcc-5-glibc-2.23/tools/go-tools/bin $PATH
set PATH /data/users/$USER/gopaths/goroot/bin $PATH

# see comment in this file for the clowniness
source ~/.config/fish/functions/fbcode_cd.fish
# make sure it happens when fish is first launched too
fbcode_cd
