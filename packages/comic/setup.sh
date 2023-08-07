#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/media/ssd"

# Creating folders
echo "Creating folders in $SSD_FOLDER (if this fails double check that you have write access)"

echo " - Creating config folder under ${SSD_FOLDER}/config"
mkdir -p $SSD_FOLDER/config/komga
mkdir -p $SSD_FOLDER/config/kaizoku

echo " - Creating folder ${SSD_FOLDER}/comic"
mkdir -p $SSD_FOLDER/comic

echo ""


# Writing env file
PUID=`id -u $USER`
PGID=`id -g $USER`
HOSTNAME=`cat /etc/hostname`

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_PUID=$PUID
DOCKER_PGID=$PGID
DOCKER_HOSTNAME=$HOSTNAME
DOCKER_DOMAINNAME=rpi.theknarf.com
DOCKER_CONFIG_FOLDER=$SSD_FOLDER/config
DOCKER_COMIC_FOLDER=$SSD_FOLDER/comic
EOM
