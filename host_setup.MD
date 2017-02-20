# Host configuraton
Download Raspbian Jessie (Lite) and copy the image over to a micro-SD card.

NOTE: by default Raspbian Jessie does not allow SSH access, because this is required make sure that you add a empty file in /boot named "ssh"


## Set root password
sudo su -
passwd

## Set hostname
echo "ups2" > /etc/hostname

## Remove user PI and /home/pi
deluser --remove-home pi

## Set GPU memory to 16MB
echo "gpu_mem=16" >> /boot/config.txt

## Enable roots access with ssh
/etc/ssh/sshd_config [with password]

## Update system
apt-get update && \
apt-get upgrade -y

## Install Docker
apt-get install -y tar \
                htop
curl -sSL https://get.docker.com | sh
