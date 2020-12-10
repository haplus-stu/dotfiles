#!/bin/bash

docker stop $(docker ps -q -a)&&docker rm $(docker ps -q -a)
