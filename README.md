#Create an APC Web Management Docker image.
![APC](/images/banner.png)

For some reason the Arch Linux community stopped providing an pre-build image for the Raspberry Pi.

## Pull sources trough git
git clone https://github.com/remonlam/rpi-docker-apcups.git

## To run the container:
docker run -d -p 80:80 --name apc-web --device=/dev/usb/hiddev0 remonlam/apc-web:latest

## Docker HUB
The Docker images is also stored @ https://hub.docker.com/r/remonlam/apc-web/
