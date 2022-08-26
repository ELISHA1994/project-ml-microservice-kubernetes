#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=elisha1994/project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run project-ml-microservice-kubernetes  --image=$dockerpath --port=80 --labels app=project-ml-microservice-kubernetes


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host T&hE9mDM

sudo -E kubectl port-forward project-ml-microservice-kubernetes 80:80
