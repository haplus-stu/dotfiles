set -eu

function comp-docker-image(){
  docker run `docker images --format "{{.Repository}}:{{.Tag}}" | fzf`
}

function exec-docker-container(){
  local CMD
  read -p "command (press enter key to skip): " CMD
  docker exec -it  `docker ps --format "{{.Names}}" | fzf` ${CMD:-bash}
}

function all-down-container(){
  docker stop `docker ps -qa` && docker rm `docker ps -qa`
}

case $1 in
  run  ) comp-docker-image ;;
  exec ) exec-docker-container ;;
  ald  ) all-down-container ;;
esac
