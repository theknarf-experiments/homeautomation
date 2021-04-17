#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/media/ssd"

# Creating folders
echo "Creating folders in $SSD_FOLDER (if this fails double check that you have write access)"

echo " - Creating config folder under ${SSD_FOLDER}/config"
mkdir -p $SSD_FOLDER/config/caddy/data
mkdir -p $SSD_FOLDER/config/caddy/config

# Writing env file
HOSTNAME=`cat /etc/hostname`

read -sp "Digitalocean api token: " DIGITALOCEAN_API_TOKEN

echo "\n"

read -p "Domainname (rpi.theknarf.com): " DOMAIN_NAME
DOMAIN_NAME=${DOMAIN_NAME:-rpi.theknarf.com}

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_HOSTNAME=$HOSTNAME
DOCKER_DOMAINNAME=$DOMAIN_NAME
DIGITALOCEAN_API_TOKEN=$DIGITALOCEAN_API_TOKEN
DOCKER_CONFIG_FOLDER=$SSD_FOLDER/config/caddy/data
DOCKER_DATA_FOLDER=$SSD_FOLDER/config/caddy/config
EOM
