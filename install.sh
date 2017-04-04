#!/bin/bash

set -e

pushd `dirname $0` > /dev/null
DOTFILES=`pwd`
popd > /dev/null

ln -s "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
