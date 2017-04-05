#!/bin/bash

set -e

pushd `dirname $0` > /dev/null
DOTFILES=`pwd`
popd > /dev/null

if [[ ! -a "$HOME/.zshrc" ]]; then
  ln -s "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
fi

if [[ ! -a "$HOME/.vimrc" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln -s "$DOTFILES/vimrc" "$HOME/.vimrc"
  vim +PluginInstall +qall
  cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
fi

git config --global alias.log "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
