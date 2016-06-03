Just a placeholder file, this will be replaced when I have the time to write things down ;-)

To run the container:
<<<<<<< HEAD
docker run -d -p 80:80 --name apc-web --device=/dev/usb/hiddev0 remonlam/apc-web /entrypoint.sh


pacman -Sy && pacman -S git docker --noconfirm && systemctl enable docker
docker pull remonlam/apc-web && docker run -d -p 80:80 --name apc-web --device=/dev/usb/hiddev0 remonlam/apc-web /entrypoint.sh
=======
docker run -d -p 80:80 --device=/dev/usb/hiddev0 remonlam/rpi-rasbian:jessie /entrypoint.sh

docker run -d -p 80:80 --device=/dev/usb/hiddev0 [IMAGE] /entrypoint.sh
<<<<<<< Updated upstream
=======
>>>>>>> origin/master
>>>>>>> Stashed changes
