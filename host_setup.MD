# Host configuraton
Download Raspbian Jessie (Lite) and copy the image over to a micro-SD card.

NOTE: by default Raspbian Jessie does not allow SSH access, because this is required make sure that you add a empty file in /boot named "ssh"



## Set root password
sudo su -
passwd

## Set hostname
echo "ups1" > /etc/hostname

## Set timezone (EU-NL-AMS)
cp -rf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

## Remove user PI and /home/pi
deluser --remove-home pi

## Set GPU memory to 16MB
echo "gpu_mem=16" >> /boot/config.txt

## Enable roots access with ssh
/etc/ssh/sshd_config [PermitRootLogin without-password / PermitRootLogin yes]
sed -i s/"PermitRootLogin without-password"/"PermitRootLogin yes"/g /etc/ssh/sshd_config
systemctl restart ssh

## Update system
apt-get update && \
apt-get upgrade -y

## Install Docker
apt-get install -y tar \
                htop
curl -sSL https://get.docker.com | sh


## Setup IP on WiFi interface
echo "interface wlan0
static ip_address=192.168.0.10/24
static routers=192.168.0.254
static domain_name_servers=192.168.0.100 8.8.8.8" >> /etc/dhcpcd.conf

echo 'network={
              ssid="WifiNetworkName"
              psk="SuperSecretPassword"
}' >> /etc/wpa_supplicant/wpa_supplicant.conf


## Setup IP on ethernet interface
echo "interface eth0
static ip_address=192.168.0.4/24
static routers=192.168.0.254
static domain_name_servers=10.10.100.100 10.10.100.110" >> /etc/dhcpcd.conf
