FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon@containerstack.io>

ENV ARCH="ARM"
ENV TERM="xterm"
ENV UPS="Smart-UPS 3000 RM"
ENV URL="http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"
ENV DEBIAN_FRONTEND="noninteractive"

# Put cron logfiles into a volume. This also works around bug # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=810669
# caused by base image using old version of coreutils
# which causes "tail: unrecognized file system type 0x794c7630 for '/var/log/cron.log'"
# when using docker with overlay storage driver.
#VOLUME /var/log/


# Make sure we use the latest stuff and install apache & apc apps:
RUN apt-get update && \
    apt-get install -y wget apcupsd apcupsd-cgi apache2 postfix nano --quiet && \
    #apt-get -y upgrade && \
    apt-get clean

RUN echo "postfix postfix/mailname string your.hostname.com" | debconf-set-selections &&\
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections &&\
    apt-get install -y mailutils

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
