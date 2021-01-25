#!/bin/sh

echo "Stop :"
docker stop -t0 $(docker ps -q)

echo "\nClean :"
docker rm $(docker ps -a -q)

echo "\nContainers :"
docker ps -a
