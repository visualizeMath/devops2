# RabbitMQ Project
A project that is deployed on local kubernetes cluster which is developed with Python and uses RabbitMQ for communication.

# Installation Instructions
### 1. Execute Permissions
Open a terminal and go to the scripts folder:
```sh
cd scripts/
```
Give execute permissions to all scripts in the 'scripts/' folder:

```sh
chmod +x *
```
### 2. Install dependencies
Run the script install_dependencies.sh to install helm, kubectl, python, erlang and netcat. If the installation is successfull the version info of each application must be displayed.

```bash
./install_dependencies.sh
```

### 3. Install docker
Run the script install_docker.sh to install docker on the machine.

```bash
./install_docker.sh
```
 **Note**: Log out and log in required after Docker installation in order to add the user to the docker group. If you are using vagrant for VM access you can log out with "exit" and log-in back with "vagrant ssh"

### 4. Install and run minikube
Run the script install_minikube.sh to install and run minikube. If the installation is successfull the version info of minikube must be displayed.

```bash
./install_minikube.sh
```

### 5. Set password for RabbitMQ user
In order not to expose the password run the following command to create a secret that'll be used later for RabbitMQ user. 

The parameter <password> needs to be replaced with the actual password.

```bash
kubectl create secret generic rabbitmq-secret --from-literal=password=<password>
```

### 6. Helm Installations
Go to the project directory (project_devops/) which contains the folders rabbitmq, consumer and producer and run the following commands:

```bash
helm install rabbitmq-dev ./rabbitmq
helm install producer-dev ./producer
helm install consumer-dev ./consumer
```
### 7. Verify Deployments
Check if the pods and services are deployed:
```bash
kubectl get pods
kubectl get svc
```

### 8. Check RabbitMQ connection
Go to the /scipts folder and run the script below to test if the RabbitMQ nodeport service is reachable.

```bash
./test-connection.sh
```

