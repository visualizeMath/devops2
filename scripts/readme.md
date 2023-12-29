# RabbitMQ Project
A project that is deployed on local kubernetes cluster which is developed with Spring Boot and uses RabbitMQ for communication.

# Installation Instructions
### Step 1: Execute Permissions
Open a terminal and go to the scripts folder:
```sh
cd scripts/
```
Give execute permissions to all scripts in the 'scripts/' folder:

```sh
chmod +x *
```

### Step 2: Install RabbitMQ
Run the following script to install RabbitMQ.
```bash
./install_rabbitmq.sh
```

### Step 3: Set RabbitMQ password
Enter the following command on terminal to set the environment variable for admin user. This way the password will not be revealed in the script.Change the <password> with the password you want to set.

```bash
export RABBITMQ_PASSWORD=<password>
```

### Step 4: Create the admin user with the determined password
Run the following command on terminal. The password is taken from the environment variable.

```bash
sudo rabbitmqctl add_user admin "$RABBITMQ_PASSWORD"
```

### Step 5: Give administrator permissions to the admin user
Run the script to grant the admin user permissions.
```bash
./grant_admin_permissions.sh
```
### Step 6: Install docker
Run the script install_docker.sh to install docker on the machine.

```bash
./install_docker.sh
```
#### Note: Log out and log in required after Docker installation in order to add the user to the docker group. If you are using vagrant for VM access you can log out with "exit" and log-in back with "vagrant ssh"

### Step 7: Install helm & kubectl
Run the script install_helm_kubectl.sh to install helm and kubectl. If the installation is successfull the version info of each application must be displayed.

```bash
./install_helm_kubectl.sh
```

### Step 8: Install minikube
Run the script install_minikube.sh to install minikube. If the installation is successfull the version info of minikube must be displayed.

```bash
./install_minikube.sh
```

