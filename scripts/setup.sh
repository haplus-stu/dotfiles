#!/usr/bin/env bash
set -eu

########################################################
#           main
########################################################

flag=${@}

function main(){
  local current_dir
  current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
  source ${current_dir}/lib/utils.sh


  source ${current_dir}/lib/install-neovim-head.sh


  ##symlink
  source ${current_dir}/lib/gitconfig.sh


  if [[ "${flag}" = "gui" ]]; then
    echomsg "start gui install..."
    source ${current_dir}/lib/install-i3.sh
    source ${current_dir}/lib/install-alacritty.sh
  else
    :
  fi
  source ${current_dir}/lib/install-zsh.sh
}

main


