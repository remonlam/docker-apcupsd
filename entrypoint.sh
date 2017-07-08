#!/bin/bash

echo "ACCESS THE UPC WEB PAGE: http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"

# Start Postfix mail relay
postfix start

# Start APC Service
service apcupsd start

# Start apache2 service
service apache2 start

# Leave this file  open
tail -F /var/log/apcupsd.events
