#!/usr/bin/env bash
set -eu pipefail

base_path=$(pwd)
scripts_path=${base_path}/scripts

source ${scripts_path}/utils.sh

check_OS
check_pkgmanger

#############################################
#
#  check install zsh
#
#############################################
if [[ ! -e /bin/zsh ]]; then
  echomsg "
  not install zsh !!! Run install zsh script!!!
  "
  source ${scripts_path}/install-zsh.sh
fi

#############################################
#
#  check exist workspace directory
#
#############################################
if [[ ! -e $HOME/workspace ]]; then
  mkdir $HOME/workspace
fi


echomsg "set gitconfig path..."
git config --global include.path '~/config/git/gitconfig'


#############################################
#
#  install neovim
#
#############################################

echomsg "install neovim..."

source ${scripts_path}/install-neovim-head.sh



#alacritty install
if [[ $1 == "gui" ]]; then
  source ${scripts_path}/gui/install-alacritty.sh
fi

#i3wm install
if [[ $1 == "gui" ]]  && [[ ${OS} == "Linux" ]]; then
  source ${scripts_path}/gui/install-i3.sh
fi

