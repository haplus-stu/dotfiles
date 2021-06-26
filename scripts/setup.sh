#!/usr/bin/env bash
set -e

########################################################
#           main
########################################################

flag=${@}

function main(){
  local current_dir
  current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
  source ${current_dir}/lib/utils.sh


  local install_package=(neovim-head docker zsh)

  for pkg in "${install_package[@]}"
  do
    source ${current_dir}/lib/install-"${pkg}".sh
  done

  ##symlink
  source ${current_dir}/lib/gitconfig.sh


  if [[ "${flag}" = "gui" ]]; then
    echomsg "start gui install..."
    source ${current_dir}/lib/install-i3.sh
    source ${current_dir}/lib/install-alacritty.sh
  else
    :
  fi
}

main


