#!/bin/sh

docker build -t ft_server ../.

# docker run -d -p 80:80 -p 443:443 ft_server

# docker exec -it $(docker ps -q | head -1) bash

# docker exec -it $(docker run -d -p 80:80 -p 443:443 ft_server) bash
