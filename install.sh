#!/bin/bash

set -e

pushd `dirname $0` > /dev/null
DOTFILES=`pwd`
popd > /dev/null

if [[ ! -a "$HOME/.config/fish" ]]; then
  ln -s "$DOTFILES/fish" "$HOME/.config/fish"
fi

if [[ ! -a "$HOME/.config/nvim" ]]; then
  ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"
  nvim +PlugInstall +qall
  nvim +UpdateRemotePlugins +qall
fi

if [[ ! -a "$HOME/.tmux.conf" ]]; then
  ln -s "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"
fi
