#!/bin/bash

# First we need to find the service name. we know that the helm chart will be installed as rabbitmq-dev
SERVICE_NAME_STARTS = "rabbitmq-dev"

#We are taking the first service name found
SERVICE_NAME=$(kubectl get svc | grep "^$SERVICE_NAME_STARTS" | awk '{print $1}' | head -n 1)

#Finding ip of the Nodeport service of rabbitmq
RABBITMQ_HOST=$(kubectl get svc $SERVICE_NAME -o jsonpath='{.spec.clusterIP}')

#RabbitMQ AMQP default port
DEFAULT_PORT=30672

echo "Checking RabbitMQ connection..."

#Trying to get a response from the service
if nc -z -w10 $RABBITMQ_HOST $DEFAULT_PORT; then
    echo "Connection to RabbitMQ is successfull."
else
    echo "Connection to RabbitMQ is not successfull. RabbitMQ port is not reachable."
fi