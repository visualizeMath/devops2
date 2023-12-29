#!/bin/bash
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