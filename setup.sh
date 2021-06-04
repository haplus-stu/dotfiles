#!/usr/bin/env bash
set -eu pipefail

base_path=$(pwd)
scripts_path=${base_path}/scripts

source ${scripts_path}/utils.sh

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
source ${scripts_path}/install-neovim-head.sh


#alacritty install
if [[ $1 == "gui" ]]; then
  source ${scripts_path}/gui/install-alacritty.sh
fi

#i3wm install
if [[ $1 == "gui" ]]  && [[ ${OS} == "Linux" ]]; then
  source ${scripts_path}/gui/install-i3.sh
fi

