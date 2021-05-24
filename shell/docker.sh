#!/bin/bash -x

if [[ $1 == "up" ]]; then
  docker-compose up -d
elif [[ $1 == "down" ]]; then

  docker-compose down --rmi all --volumes --remove-orphans

elif [[ $1 == "del" ]]; then

  echo "----- docker stopping...-----"
  docker stop $(docker ps -q -a)

  echo "----- docker removing...-----"
  docker rm $(docker ps -q -a)

elif [[ $1 == "exec" ]]; then
  docker exec -it $2 bash
fi

