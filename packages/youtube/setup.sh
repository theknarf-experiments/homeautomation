#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/media/ssd"


# Creating folders
echo "Creating folders in $SSD_FOLDER (if this fails double check that you have write access)"

echo " - Creating ${SSD_FOLDER}/youtube_downloads"
mkdir -p $SSD_FOLDER/youtube_downloads

echo ""

# Writing env file
PUID=`id -u $USER`
PGID=`id -g $USER`

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_DOMAINNAME=rpi.theknarf.com
DOCKER_PUID=$PUID
DOCKER_PGID=$PGID
DOCKER_DOWNLOADS_FOLDER=$SSD_FOLDER/youtube_downloads
EOM
