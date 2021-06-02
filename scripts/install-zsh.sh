#!/usr/bin/env bash

source ./utils.sh

check_pkgmanger

if [[ "${PKGMANAGER}" == "apt" ]];then
  sudo apt -y install zsh
elif [[ "${PKGMANAGER}" == "pacman" ]];then
  sudo pacman -S zsh --no-confirm
fi

if [[ -e /bin/zsh ]]; then
exec $SHELL -l
else
 echo "zsh not found"
 exit 1
fi
