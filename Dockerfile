FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon@containerstack.io>

ENV ARCH="ARM"
ENV TERM="xterm"
ENV UPS="Smart-UPS 3000 RM"
ENV URL="http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"

# Make sure we use the latest stuff and install apache & apc apps:
RUN apt-get update && \
    apt-get install -y wget apcupsd apcupsd-cgi apache2 --quiet && \
    apt-get -y upgrade && \
    apt-get clean

# Remove orginal apcupsd config files
RUN rm -r /etc/default/apcupsd && \
    rm -r /etc/apcupsd/apcupsd.conf && \
    rm -r /etc/apache2/apache2.conf && \
    cp -rf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

COPY entrypoint.sh /
COPY sources/apcupsd /etc/default/
COPY sources/apcupsd.conf /etc/apcupsd/
COPY sources/apache2.conf /etc/apache2/

RUN mkdir -p /etc/apache2/conf.d

# Restart apcupsd service
RUN service apcupsd stop
RUN service apache2 stop
RUN a2enmod cgi
RUN service apcupsd start
RUN service apache2 start

EXPOSE 80
CMD ["/entrypoint.sh"]
