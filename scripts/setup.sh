#!/usr/bin/env bash
set -eu pipefail

source ./utils.sh

check_OS
check_pkgmanger

if [[ ! -e /bin/zsh ]]; then
  echo "
  #####################################################
  not install zsh Please install zsh!!!
  #####################################################
  "
  exit 1
fi

if [[ ! -e $HOME/workspace ]]; then
  mkdir $HOME/workspace
fi

echo "create zsh symlink..."
for file in $(ls $HOME/config/shell/zsh); do
  ln -nfs $HOME/config/shell/zsh/${file} $HOME/.${file}
done


echo "set gitconfig path..."
git config --global include.path "$HOME/config/gitconfig"

# #minimal install
source ./install-neovim-head.sh

if [[ $1 == "gui" ]]  && [[ ${OS} == "Linux" ]]; then
  source ./install-i3.sh
fi

