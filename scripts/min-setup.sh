if [[ "$1" = "arch" ]]; then
  PACKAGE_CMD="pacman -S "
  echo ${PACKAGE_CMD}
elif [[ "$1" = "ubuntu" ]]; then
  PACKAGE_CMD="apt install"
  echo ${PACKAGE_CMD}
fi

echo "
#===============
check upgrade
#==============="

if [[ "$1" -eq "ubuntu" ]]; then
  sudo apt update -y
elif [[ "$1" -eq "arch" ]]; then
  sudo pacman -Sy
fi


INSTALL_PKG_LIST=("neovim" "nodejs" "npm" "tmux");

for pkg in "${INSTALL_PKG_LIST[@]}"
do
  echo "
  #==================
  sudo $PACKAGE_CMD $pkg"
  #=================="
  sudo $PACKAGE_CMD -y $pkg
done

#rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

cargo install exa bat rusmo zoxide starship

