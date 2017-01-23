FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon@containerstack.io>

ENV TERM="xter"
ENV UPS="Smart-UPS 3000 RM"

# Make sure we use the latest stuff and install apache & apc apps:
RUN apt-get update && \
    apt-get install -y wget apcupsd apcupsd-cgi apache2 --quiet && \
    apt-get -y upgrade && \
    apt-get clean

# Remove orginal apcupsd config files
RUN rm -r /etc/default/apcupsd && \
    rm -r /etc/apcupsd/apcupsd.conf && \
    rm -r /etc/apache2/apache2.conf

RUN cp entrypoint.sh / && \
    cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
    cp /etc/default/apcupsd && \
    cp ../sources/apcupsd.conf /etc/apcupsd/ && \
    cp ../sources/apache2.conf /etc/apache2/

RUN mkdir -p /etc/apache2/conf.d

# Restart apcupsd service
RUN service apcupsd restart && \
    service apache2 restart && \
    a2enmod cgi && \
    service apache2 restart

EXPOSE 80
CMD ["/entrypoint.sh"]
