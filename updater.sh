#!/bin/sh

# THIS SCIRPT WILL UPTDATE THE APC IMAGE ON THE DOCKER NODE;

docker pull remonlam/apc-web
docker stop $(docker ps -a -q)
docker rm apc-web
#docker pull remonlam/apc-web
docker run -d -p 80:80 --name apc-web --device=/dev/usb/hiddev0 remonlam/apc-web:latest /entrypoint.sh
