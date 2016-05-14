FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

RUN apt-get update && apt-get install -y wget git
RUN wget -P /tmp https://raw.githubusercontent.com/remonlam/rpi-docker-apcups/master/install.sh \
    wget -P / https://raw.githubusercontent.com/remonlam/rpi-docker-apcups/master/entrypoint.sh \
    chmod 755 /./entrypoint.sh \
    chmod 755 /tmp/./install.sh
RUN /tmp/./install.sh



EXPOSE 80
## CMD ./entrypoint.sh
CMD ["entrypoint.sh"]
