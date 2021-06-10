#!/usr/bin/env bash

function install_zsh(){
  source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh
  check_pkgmanger

  if [[ "${PKGMANAGER}" == "apt" ]];then
    sudo apt -y install zsh
  elif [[ "${PKGMANAGER}" == "pacman" ]];then
    sudo pacman -S zsh --no-confirm
  fi

  if [[ -e /bin/zsh ]]; then
    chsh -s /bin/zsh
    exec $(which zsh)
  else
    echomsg "zsh not found"
    exit 1
  fi

  echomsg "create zsh symlink..."
  for file in $(ls $HOME/config/shell/zsh); do
    ln -nfs $HOME/config/shell/zsh/${file} $HOME/.${file}
  done

}

install_zsh


