#!/bin/bash

# Writing env file
HOSTNAME=`cat /etc/hostname`

read -sp "Digitalocean api token: " DIGITALOCEAN_API_TOKEN
echo "\n"

DEFAULT_DOMAIN="$HOSTNAME.theknarf.com"
read -p "Domainname ($DEFAULT_DOMAIN): " DOMAIN_NAME
DOMAIN_NAME=${DOMAIN_NAME:-$DEFAULT_DOMAIN}

echo "Creating a .env file"
cat > .env <<- EOM
DOCKER_DOMAINNAME=$DOMAIN_NAME
DIGITALOCEAN_API_TOKEN=$DIGITALOCEAN_API_TOKEN
EOM
