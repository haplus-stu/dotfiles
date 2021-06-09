#!/usr/bin/env bash

check_OS(){
  if [[ "$(uname)" == "Darwin"  ]]; then
    export OS="Mac"
  else
    export OS="Linux"
  fi
  echo "OS : ${OS}"
}

check_pkgmanger(){
  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    case $ID in
      ubuntu ) export PKGMANAGER="apt";;
      arch ) export PKGMANAGER="pacman";;
    esac

    echo ${PKGMANAGER}
  else
    echo "/etc/os-release is not exist."
  fi
}

echomsg(){
echo "
#####################################################
$1
#####################################################
"
}
