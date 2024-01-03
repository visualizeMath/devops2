#!/bin/bash

#first we need to check if the rabbitmq-dev release already exists
if helm list | grep -q "rabbitmq-dev"; then
    echo "  rabbitmq-dev release already exists. It'll be upgraded."
    helm upgrade rabbitmq-dev ./rabbitmq
else
    echo "  rabbitmq-dev is being deployed.."
    #deploy RabbitMQ chart to the cluster
    helm install rabbitmq-dev ./rabbitmq
fi    

#check if the producer-dev release already exists
if helm list | grep -q "producer-dev"; then
    echo "  producer-dev release already exists. It'll be upgraded."
    helm upgrade producer-dev ./producer
else
    echo "  producer-dev is being deployed.."
    #deploy Producer chart to the cluster
    helm install producer-dev ./producer
fi 

#check if the consumer-dev release already exists
if helm list | grep -q "consumer-dev"; then
    echo "  consumer-dev release already exists. It'll be upgraded."
    helm upgrade consumer-dev ./consumer
else
    echo "  consumer-dev is being deployed .."
    #deploy Consumer chart to the cluster
    helm install consumer-dev ./consumer
fi
