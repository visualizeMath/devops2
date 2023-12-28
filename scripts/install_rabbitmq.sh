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

#Start Rabbitmq Server
echo "Starting RabbitMQ Server.."
sudo systemctl start rabbitmq-server

#Enable plug-ins
echo "Enabling RabbitMQ plug-ins.."
sudo rabbitmq-plugins enable rabbitmq_management

# Install Minikube
echo "Downloding Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/minikube

# Verify installation
echo "Verifying Minikube installation..."
minikube version	

# Start Minikube with the Docker driver
minikube start --driver=docker
