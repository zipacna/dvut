#!/usr/bin/env bash
git pull
sudo docker-compose rm -s -f dvut-s
sudo docker-compose up -d --remove-orphans --no-deps --build dvut-s
sudo docker ps -a
curl 172.20.0.5
sudo docker-compose logs
