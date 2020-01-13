#!/bin/bash

docker network create app_net --subnet=172.16.238.0/24
docker volume create --name=composer-data56
docker volume create --name=composer-data71
docker volume create --name=composer-data72
docker volume create --name=composer-data73

docker volume create --name=portainer_data