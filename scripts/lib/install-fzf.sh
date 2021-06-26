#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

check_OS


echomsg "install fzf ..."

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
