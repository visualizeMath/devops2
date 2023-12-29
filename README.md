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

### 2. Install RabbitMQ
Run the following script to install RabbitMQ.
```bash
./install_rabbitmq.sh
```

### 3. Set RabbitMQ password
Enter the following command on terminal to set the environment variable for admin user. This way the password will not be revealed in the script. Change the <password> with the password you want to set.

```bash
export RABBITMQ_PASSWORD=<password>
```

### 4. Create the admin user with the determined password
Run the following command on terminal. The password is taken from the environment variable.

```bash
sudo rabbitmqctl add_user admin "$RABBITMQ_PASSWORD"
```

### 5. Give administrator permissions to the admin user
Run the script to grant the user admin, administrator permissions.
```bash
./grant_admin_permissions.sh
```
### 6. Install docker
Run the script install_docker.sh to install docker on the machine.

```bash
./install_docker.sh
```
 **Note**: Log out and log in required after Docker installation in order to add the user to the docker group. If you are using vagrant for VM access you can log out with "exit" and log-in back with "vagrant ssh"

### 7. Install dependencies
Run the script install_dependencies.sh to install helm, kubectl, python and netcat. If the installation is successfull the version info of each application must be displayed.

```bash
./install_dependencies.sh
```

### 8. Install minikube
Run the script install_minikube.sh to install minikube. If the installation is successfull the version info of minikube must be displayed.

```bash
./install_minikube.sh
```

### 9. Set password for RabbitMQ user
In order not to reveal the password run the following command to set the password for RabbitMQ. 

Change the parameter <password> with the password you want to set.

```bash
kubectl create secret generic rabbitmq-secret-password --from-literal=password=<password>
```
### 10. Helm Installations
Go to the project directory (project_devops/) which contains the folders rabbitmq, consumer and producer and run the following commands:

```bash
helm install rabbitmq-dev ./rabbitmq
helm install producer-dev ./producer
helm install consumer-dev ./consumer
```
### 11. Verify Deployments
Check if the pods and services are deployed:
```bash
kubectl get pods
kubectl get svc
```

### 12. Check RabbitMQ connection
Go to the /scipts folder and run the script below to test if the RabbitMQ nodeport service is reachable.

```bash
./test-connection.sh
```

