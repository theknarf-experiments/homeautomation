#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/ssd"


# Creating folders
echo "Creating folders in $SSD_FOLDER (if this fails double check that you have write access)"

echo " - Creating config folder under ${SSD_FOLDER}/config"
mkdir -p $SSD_FOLDER/config/sonarr
mkdir -p $SSD_FOLDER/config/jackett
mkdir -p $SSD_FOLDER/config/transmission
mkdir -p $SSD_FOLDER/config/jellyfin


echo " - Creating ${SSD_FOLDER}/downloads"
mkdir -p $SSD_FOLDER/downloads

echo " - Creating ${SSD_FOLDER}/tv"
mkdir -p $SSD_FOLDER/tv

echo " - Creating ${SSD_FOLDER}/movies"
mkdir -p $SSD_FOLDER/movies

echo ""


# Writing env file
PUID=`id -u $USER`
PGID=`id -g $USER`
TIMEZONE=`cat /etc/timezone`

echo "What password do you want to use for Transmission / Torrent?"
read -sp "Password: " TORRENT_PASSWORD

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_HOSTNAME=raspberrypi
DOCKER_TIMEZONE=$TIMEZONE
DOCKER_PUID=$PUID
DOCKER_PGID=$PGID
DOCKER_CONFIG_FOLDER=$SSD_FOLDER/config
DOCKER_DOWNLOADS_FOLDER=$SSD_FOLDER/downloads
DOCKER_TV_SERIES_FOLDER=$SSD_FOLDER/tv
DOCKER_MOVIES_FOLDER=$SSD_FOLDER/movies
DOCKER_TORRENT_USERNAME=$USER
DOCKER_TORRENT_PASSWORD=$TORRENT_PASSWORD
EOM
