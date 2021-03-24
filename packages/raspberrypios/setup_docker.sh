#!/bin/bash

# Ensure that api packages is updated
sudo apt update
sudo apt upgrade

# Install dependencies needed for docker and docker-compose
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	software-properties-common
	libffi-dev \
	libssl-dev

sudo apt install -y python3-dev

sudo apt-get install -y \
	python3 \
	python3-pip

# Download and install Docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

# Add dockers official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify fingerprint of GPG key
sudo apt-key fingerprint 0EBFCD88

# Add docker repo to apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Give user docker access
sudo usermod -aG docker $USER

# Install docker-compose
sudo pip3 install docker-compose

# Rerun apt-get update / upgrade
sudo apt-get update
sudo apt-get upgrade

# Start the Docker service
systemctl start docker.service

# All done
echo "Docker and docker-compose should now be installed"
echo "You can verify this by running the following two commands:"
echo ""
echo "docker info"
echo "docker-compose --version"
