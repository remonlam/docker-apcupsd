#!/bin/bash

# Start APC Service
service apcupsd start

# Start apache2 service
service apache2 start

# Leave this file  open
tail -F /var/log/apache2/access.log
