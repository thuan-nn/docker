#!/bin/bash

mkdir /etc/apache2/ssl 2> /dev/null

# Start apache in foreground
/usr/sbin/apache2ctl -D FOREGROUND
