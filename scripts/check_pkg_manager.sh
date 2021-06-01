#!/bin/bash
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
