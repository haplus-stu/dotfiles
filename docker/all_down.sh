#!/bin/bash


echo "----- docker stopping...-----"
docker stop $(docker ps -q -a)

echo "----- docker removing...-----"
docker rm $(docker ps -q -a)
