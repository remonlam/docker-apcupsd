#Create an APC Web Management Docker image.
![APC](/images/banner.png)

For some reason the Arch Linux community stopped providing an pre-build image for the Raspberry Pi.

## Pull sources trough git
git clone https://github.com/remonlam/rpi-docker-apcups.git <br />
cd rpi-docker-apcups <br />
docker build -t apc-web .

NOTE: building the Docker image could take some time on a RPI2 it takes about 15 minutes

## To run the container:

docker run \ <br>
  --name apcupsd_0.0.1 \ <br>
  --detach \ <br>
  --restart always \ <br>
  --hostname $(hostname) \ <br>
  --publish 80:80 \ <br>
  --env MAILRELAY="containerstack-io.mail.protection.outlook.com" \<br>
  --device=/dev/usb/hiddev0 \ <br>
  remonlam/apcupsd:0.0.1_arm <br>

docker run -d --name apc-web --hostname $(hostname) -p 80:80 --device=/dev/usb/hiddev0 remonlam/rpi-docker-apcups:latest <br>
docker run -d --name apc-man --hostname $(hostname) --device=/dev/usb/hiddev0 remonlam/rpi-docker-apcups:latest

## Docker HUB
The Docker images is also stored @ https://hub.docker.com/r/remonlam/rpi-docker-apcups/
