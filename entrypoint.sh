#!/bin/bash

echo "ACCESS THE UPC WEB PAGE: http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"

# Set hostname in Postfix config file
sed -i s/updateNodeName/$HOSTNAME/g /etc/postfix/main.cf

# Start Postfix mail relay
postfix start

# Start APC Service
service apcupsd start

# Start apache2 service
service apache2 start

# Leave this file  open
tail -F /var/log/apcupsd.events
