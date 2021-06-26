#!/usr/bin/env bash
source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

check_pkgmanger


echomsg "install docker..."

if [[ "${PKGMANAGER}" == "pacman" ]]; then
  sudo pacman -S docker docker-compose --noconfirm

elif [[ "${PKGMANAGER}" == "apt" ]]; then
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-compose
fi

sudo usermod -aG docker $USER
