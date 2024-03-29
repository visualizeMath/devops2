#!/bin/bash

#Install curl
 sudo apt-get install -y curl

# Update package lists
sudo apt update
# Install docker.io
echo "Installing docker.."    

# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

echo "Docker installation completed. Please log out and log in to apply group changes."

