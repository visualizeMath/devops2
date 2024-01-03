#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
# Download Helm using wget and install
	echo "Downloding Helm .."
	wget https://get.helm.sh/helm-v3.13.1-linux-amd64.tar.gz
	tar -zxvf helm-v3.13.1-linux-amd64.tar.gz
	echo "Installing Helm .."
	sudo install linux-amd64/helm /usr/local/bin/helm
#Verify installation
	helm version

# Download Kubectl using wget and install
	echo "Downloading kubectl..."
	curl -Lo kubectl https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
	chmod +x kubectl
	sudo install kubectl /usr/local/bin/kubectl

	echo "Verifying kubectl installation..."
	kubectl version
	
# Installing netcat for testing the RabbitMQ connection later
echo "Installing netcat"
sudo apt-get install -y netcat

#Installing python 3.*
echo "Installing Python3"
sudo apt-get install -y python3 python3-pip

echo "Python installed "

echo "Installing Erlang..."
#Install erlang
sudo apt-get install -y erlang


