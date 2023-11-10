#!/bin/bash
sudo apt update
sudo apt-get install -y docker.io
sudo apt-get install -y docker-compose 
cd /home/ubuntu
mkdir app
echo "version: '3.3'
services:
  python-api:
    image: cataluniat1/python-django-pipeline:latest
    ports:
      - "80:80"
    restart: always
" >> ./app/docker-compose.yml 
sudo docker-compose -f ./app/docker-compose.yml up -d 