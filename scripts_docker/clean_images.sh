#!/bin/sh

echo "Stop container(s):"
docker stop -t0 $(docker ps -q)

echo "\nClean container(s) :"
docker rm $(docker ps -a -q)

echo "\nContainer(s) list :"
docker ps -a

echo "\nClean image(s) :"
docker rmi $(docker images -a -q)

echo "\nImage(s) list:"
docker images -a
