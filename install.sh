# #!/bin/bash -e
# 
# IGNORE_PATTERN="^\.(git|travis)"
# 
# echo "Create dotfile links."
# for dotfile in .??*; do
#     [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
#     ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
# done
# echo "Success"

#!/bin/bash

VIM_FILES=(.vimrc .plugin.vim)
DOT_FILES=(.tmux.conf .zshrc .gitconfig)

for dotfile in ${VIM_FILES[@]}
do
	ln -s $HOME/dotfiles/vim/$file $HOME/$file
done

for dotfile in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

