#neovim head
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
chmod +x /tmp/nvim-nightly;
sudo mv /tmp/nvim-nightly /usr/local/bin;


#rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

cargo install exa bat rusmo zoxide
