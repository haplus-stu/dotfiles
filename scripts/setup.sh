#!/usr/bin/env bash
set -eu pipefail

########################################################
#           main
########################################################
function main(){
  local current_dir
  current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
  source ${current_dir}/lib/utils.sh


  if[[ "$1" == gui ]]; then
    source ${current_dir}/lib/install-i3.sh
    source ${current_dir}/lib/install-alacritty.sh
  fi

  source ${current_dir}/lib/install-neovim-head.sh


  ##symlink
  source ${current_dir}/lib/gitconfig.sh
}

main


# #############################################
# #
# #  check install zsh
# #
# #############################################
# if [[ ! -e /bin/zsh ]]; then
#   echomsg "
#   not install zsh !!! Run install zsh script!!!
#   "
#   source ${scripts_path}/install-zsh.sh
# fi
# 
# #############################################
# #
# #  check exist workspace directory
# #
# #############################################
# if [[ ! -e $HOME/workspace ]]; then
#   mkdir $HOME/workspace
# fi
# 
# 
# echomsg "set gitconfig path..."
# git config --global include.path '~/config/git/gitconfig'
# 
# 
# #############################################
# #
# #  install neovim
# #
# #############################################
# 
# echomsg "install neovim..."
# 
# source ${scripts_path}/install-neovim-head.sh
# 
# 
# 
# #alacritty install
# if [[ $1 == "gui" ]]; then
#   source ${scripts_path}/gui/install-alacritty.sh
# fi
# 
# #i3wm install
# if [[ $1 == "gui" ]]  && [[ ${OS} == "Linux" ]]; then
#   source ${scripts_path}/gui/install-i3.sh
# fi
# 
