#!/bin/sh

echo "Stop :"
docker stop $(docker ps -a -q)

echo "\nClean :"
docker rm $(docker ps -a -q)

