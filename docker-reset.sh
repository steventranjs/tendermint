#!/bin/bash

docker rm -f $(docker ps -a -q)
docker network prune -f
docker volume prune -f
docker image prune -f