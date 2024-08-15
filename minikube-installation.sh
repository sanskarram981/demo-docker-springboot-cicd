#!/bin/bash

GREEN='\033[32m'
RESET='\033[0m'

echo -e "${GREEN}Welcome to Minikube & Kubectl installation${RESET}"

sudo apt update
sudo apt install -y curl apt-transport-https
cd ..
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "${GREEN} minikube version is :${RESET} $(minikube version)"
curl -LO "https://dl.k8s.io/release/v1.27.4/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "${GREEN} kubectl version is :${RESET} $(kubectl version)"
minikube start --driver=docker
echo "${GREEN} minikube status :${RESET} $(minikube status)"
echo "${GREEN} kubectl cluster-info :${RESET} $(kubectl cluster-info)"
echo "${GREEN} cluster nodes are :${RESET} $(kubectl get nodes)"
echo "minikube dashboard && minikube stop && minikube delete"
echo -e "${GREEN}Exiting from Minikube & Kubectl installation${RESET}"


