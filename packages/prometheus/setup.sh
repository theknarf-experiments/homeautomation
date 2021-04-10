#!/bin/bash

# If you have mounted the ssd somewhere else then change this variable before running
SSD_FOLDER="/media/ssd"

# Creating folders
echo "Creating folders in $SSD_FOLDER (if this fails double check that you have write access)"

echo " - Creating ${SSD_FOLDER}/prometheus"
mkdir -p $SSD_FOLDER/prometheus

echo " - Copying prometheus.yml to ${SSD_FOLDER}/prometheus"
cp prometheus.yml $SSD_FOLDER/prometheus

echo ""

# Writing env file

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_DOMAINNAME=rpi.theknarf.com
DOCKER_PROMETHEUS_FOLDER=$SSD_FOLDER/prometheus
EOM
