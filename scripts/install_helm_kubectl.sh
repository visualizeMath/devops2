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
	
# in order to install SDKMAN(Software Development Kit Manager) we need zip and unzip.	
# Install zip
	echo "Installing zip.."
	sudo apt-get install zip
# Install unzip
	echo "Installing unzip.."
	sudo apt-get install unzip

# Install SDKMAN from the internet and run it on bash
	curl -s "https://get.sdkman.io" | bash	

#Install Java using SDK
	sdk install java
#We add the bin directory to PATH and we make the SDK commands reachable from shell with source command. 
	source "$HOME/.sdkman/bin/sdkman-init.sh"
#Install springboot
	echo "Installing springboot.."
	 sdk install springboot
	echo "Springboot version:"
	spring --version


