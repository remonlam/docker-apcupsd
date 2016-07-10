FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon@containerstack.io>

RUN apt-get update && apt-get install -y wget git ntp && apt-get clean
RUN git clone https://github.com/remonlam/rpi-docker-apcups.git

## RUN wget -P /tmp https://raw.githubusercontent.com/remonlam/rpi-docker-apcups/master/install.sh \
##    wget -P / https://raw.githubusercontent.com/remonlam/rpi-docker-apcups/master/entrypoint.sh \
##    chmod 755 /./entrypoint.sh \
##    chmod 755 /tmp/./install.sh
RUN /rpi-docker-apcups/./install.sh
RUN cp /rpi-docker-apcups/entrypoint.sh /
RUN cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

EXPOSE 80
CMD ["entrypoint.sh"]
