#!/bin/bash

read -p "Domainname (rpi.theknarf.com): " DOMAIN_NAME
DOMAIN_NAME=${DOMAIN_NAME:-rpi.theknarf.com}

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_HOSTNAME=$HOSTNAME
DOCKER_DOMAINNAME=$DOMAIN_NAME
EOM
