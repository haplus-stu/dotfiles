#!/usr/bin/env bash

set -eu

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function setup_alacritty(){
  check_pkgmanger

  if[[ "${PKGMANAGER}" == pacman ]]; then
        sudo pacman -S --noconfirm --needed alacritty
  fi
}

setup_alacritty
