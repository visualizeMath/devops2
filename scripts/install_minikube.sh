#!/bin/bash
# Install Minikube
echo "Downloding Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/minikube

# Verify Minikube installation
echo "Verifying Minikube installation..."
minikube version	

echo "Starting minikube.."
# Start Minikube with the Docker driver
minikube start --driver=docker
