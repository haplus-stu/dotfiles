#!/usr/bin/env bash

source ./utils.sh

check_pkgmanger

if [[ "${PKGMANAGER}" == "apt" ]];then
  sudo apt -y install zsh
elif [[ "${PKGMANAGER}" == "pacman" ]];then
  sudo pacman -S zsh --no-confirm
elif

chsh -s /bin/zsh

exec $SHELL -l
