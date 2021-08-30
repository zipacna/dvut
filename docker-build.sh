#!/usr/bin/env bash
sudo docker-compose rm -s -f dvut-s
sudo docker-compose up -d --remove-orphans --no-deps --build dvut-s
