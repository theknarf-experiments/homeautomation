#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/media/ssd"

# Writing env file
PUID=`id -u $USER`
PGID=`id -g $USER`
TIMEZONE=`cat /etc/timezone`

echo "What password do you want to use for Samba?"
read -sp "Password: " SAMBA_PASSWORD

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_TIMEZONE=$TIMEZONE
DOCKER_PUID=$PUID
DOCKER_PGID=$PGID
DOCKER_SAMBA_PASSWORD=$SAMBA_PASSWORD
EOM
