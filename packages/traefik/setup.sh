#!/bin/bash

# Writing env file
HOSTNAME=`cat /etc/hostname`

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_HOSTNAME=$HOSTNAME
DOCKER_DOMAINNAME=rpi.theknarf.com
EOM
