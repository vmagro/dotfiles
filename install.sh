#!/bin/bash
SCRIPT="$(realpath "$0")"
DIR="$(dirname "$SCRIPT")"

set -x

ln -f -s "$DIR/nvim" "$HOME/.config/nvim"
ln -f -s "$DIR/tmux.conf" "$HOME/.tmux.conf"

ln -f -s "$DIR/prezto" "$HOME/.zprezto"
ln -f -s "$DIR/prezto/runcoms/zshrc" "$HOME/.zshrc"
ln -f -s "$DIR/prezto/runcoms/zlogin" "$HOME/.zlogin"
ln -f -s "$DIR/prezto/runcoms/zlogout" "$HOME/.zlogout"
ln -f -s "$DIR/prezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
ln -f -s "$DIR/prezto/runcoms/zshenv" "$HOME/.zshenv"

rm "$DIR/nvim/nvim"
rm "$DIR/prezto/prezto"

touch "$DIR/.installed"
