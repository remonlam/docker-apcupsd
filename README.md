Just a placeholder file, this will be replaced when I have the time to write things down ;-)

To run the container:
docker run -d -p 80:80 --device=/dev/usb/hiddev0 remonlam/rpi-rasbian:jessie /entrypoint.sh

docker run -d -p 80:80 --device=/dev/usb/hiddev0 [IMAGE] /entrypoint.sh
