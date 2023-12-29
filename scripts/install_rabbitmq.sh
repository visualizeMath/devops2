#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade

echo "Installing Erlang..."
#Install erlang
sudo apt-get install -y erlang

#Install Rabbitmq Server
echo "Installing RabbitMQ Server..."
sudo apt-get install -y rabbitmq-server
echo "RabbitMQ Server installed."

#Enable Rabbitmq Server on system boot. This way it'll be ensured that the Rabbitmq server will be enabled automatically
echo "Enabling RabbitMQ Server on system boot.."
sudo systemctl enable rabbitmq-server

#Start RabbitMQ Server
echo "Starting RabbitMQ Server.."
sudo systemctl start rabbitmq-server

#Enable plug-ins
echo "Enabling RabbitMQ plug-ins.."
sudo rabbitmq-plugins enable rabbitmq_management

#Verify RabbitMQ installation
echo "Verifying RabbitMQ installation..."

#The version info is located in the line: {rabbit,"RabbitMQ","3.5.7"}
#We are splitting the line by the character '"' and take the 4th argument which is the version info.
sudo rabbitmqctl status | grep "{rabbit," | awk -F'"' '{print $4}'
