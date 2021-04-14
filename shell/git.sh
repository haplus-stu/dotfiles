
function confirm(){
  read -p "do you reset data really ? (y/n)" YN_LOADSETTING

  if [ "${YN_LOADSETTING}" != "y" ]; then
    $1
    exit 1
  fi
}

git diff

# confirm git add -A
confirm git add .

confirm git commit

confirm git push origin $(git rev-parse --abbrev-ref HEAD)
