# #!/bin/bash
# 
# set -u
# 
# #get directory of run
# THIS_DIR=$(cd$(dirname $0); pwd)
# 
# cd $THIS_DIR
# git submodule init
# git submodule update
# 
# echo 'start setup...'
# for f in .??*;do
#     ["$f"=".git"] && continue
#     [ "$f" = ".gitconfig.local.template" ] && continue
#     [ "$f" = ".require_oh-my-zsh" ] && continue
#     [ "$f" = ".gitmodules" ] && continue
# 
#     ln -snfv ~/dotfiles/"$f" ~/
# done
# 
# [ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local
# 
# # emacs set up
# if which cask >/dev/null 2>&1; then
#   echo "setup .emacs.d..."
#   cd ${THIS_DIR}/.emacs.d
#   cask upgrade
#   cask install
# fi
# 
# cat << END
# 
# **************************************************
# DOTFILES SETUP FINISHED! bye.
# **************************************************
# 
# END

#!/bin/bash -e

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "Success"
