FROM containerstack/alpine:3.8.0-armhf
MAINTAINER Remon Lam <remon@containerstack.io>

ENV ARCH="ARM"
ENV TERM="xterm"
ENV UPS="Smart-UPS 3000 RM"
ENV URL="http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"
ENV DEBIAN_FRONTEND="noninteractive"

# Make sure we use the latest stuff and install apache & apc apps:
#RUN apt-get update && \
#    apt-get install -y wget apcupsd apcupsd-cgi apache2 postfix mailutils --quiet && \
#    apt-get -y upgrade && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

RUN apk add apcupsd apcupsd-webif apache2 postfix tzdata && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing mailutils && \
    rm -f /var/cache/apk/*

# Remove orginal apcupsd config files
RUN rm -r /etc/apcupsd/apcupsd.conf && \
#    rm -r /etc/apcupsd/apcupsd.conf && \
#    rm -r /etc/apache2/apache2.conf && \
#    rm -r /etc/apache2/apache2.conf && \
    rm -r /etc/apache2/httpd.conf && \
    rm -r /etc/postfix/master.cf && \
    rm -r /etc/postfix/main.cf
#    rm -r /etc/aliases

# Set date/time
#RUN cp -rf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

# Copy sources
#COPY entrypoint.sh /
#COPY sources/apcupsd /etc/default/
#COPY sources/apcupsd.conf /etc/apcupsd/
#COPY sources/apccontrol /etc/apcupsd/
#COPY sources/apache2.conf /etc/apache2/
#COPY sources/master.cf /etc/postfix/
#COPY sources/main.cf /etc/postfix/
#COPY sources/aliases /etc/

# Create aliases
#RUN newaliases

# Create apache dir
#RUN mkdir -p /etc/apache2/conf.d

# Restart apcupsd service
#RUN service apcupsd stop
#RUN service apache2 stop
#RUN a2enmod cgi
#RUN service apcupsd start
#RUN service apache2 start

EXPOSE 80 3551/tcp 3551/udp
#CMD ["/entrypoint.sh"]
