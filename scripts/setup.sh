#!/usr/bin/env bash
set -eu

source ./utils.sh

check_OS

if [[ ! -e $HOME/workspace ]]; then
  mkdir $HOME/workspace
fi


echo "set gitconfig path..."
git config --global include.path "$HOME/config/gitconfig"

# #minimal install
source ./install-neovim-head.sh

if [ $1 == "gui" ]  && [ ${OS} == "Linux" ]; then
  source ./install-i3.sh
fi

