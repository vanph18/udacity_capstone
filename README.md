# Udacity AWS DevOps Engineer Capstone Project

[![kcemenike](https://circleci.com/gh/kcemenike/operationalize-ml.svg?style=svg)](https://app.circleci.com/pipelines/github/vanph18/udacity_capstone)

## Project Overview

This capstone project showcases the use of several CI/CD tools and cloud services covered in the program [Udacity - AWS Cloud DevOps Engineer.](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

### Introduction

This project "operationalize" a sample python/[flask](https://flask.palletsprojects.com/)

## What does this project do?

- Create Github repository with project code
- Use image repository to store Docker images
- Execute linting step in code pipeline
- Build a Docker container in a pipeline
- The Docker container is deployed to a Kubernetes cluster
- Use a Rolling Deployment successfully

## Requirements
 - Python 3.7

## START HERE

### Step 1
- install python3.7
- sudo apt update
- sudo apt install software-properties-common
- sudo add-apt-repository ppa:deadsnakes/ppa
- sudo apt install python3.7
- python3.7 --version
- setup environment for python3.7
- sudo apt install python3.7-venv  
- python3.7 -m venv ~/.devops
- source ~/.devops/bin/activate

### Step 2
- install docker
- sudo apt update
- sudo apt install apt-transport-https ca-certificates curl software-properties-common
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
- echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt update
- apt-cache policy docker-ce
- sudo apt install docker-ce
- sudo systemctl status docker
- Executing the Docker Command Without Sudo
- setup password for ubuntu
- sudo passwd ubuntu
- sudo usermod -aG docker ${USER}
- su - ${USER}

### Step 3
- install kubectl
- curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/linux/amd64/kubectl
- chmod +x ./kubectl
- sudo mv ./kubectl /usr/local/bin
- kubectl version --short --client

### Step 4
- install AWS CLI
- curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip 
- sudo apt install unzip	
- unzip awscliv2.zip
- sudo ./aws/install
- aws --version

### Step 5
- install eksctl
- curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
- sudo mv /tmp/eksctl /usr/local/bin
- eksctl version 

### Step 6
- run docker
- docker build --tag=hello .
- docker image list
- docker run -p 80:80 hello 

### Step 7
- upload docker images
- dockerpath="vanph/hello:v1.0.0"
- docker login
- docker tag hello ${dockerpath}
- echo "Docker ID and Image: $dockerpath"
- docker push ${dockerpath}

### Step 8
 - aws configure

### Step 9
- create cluster
- eksctl create cluster --name k8s-235 --region us-east-1 --node-type t3.small --nodes 2
- get list clusters
- aws eks list-clusters

### Step 10
- deployement kubernet
- kubectl create deployment hello --image=vanph/hello:v1.0.0 --replicas=3
- get status after deployment
- kubectl get deployment

### Step 11
- expose deployment
- kubectl expose deployment/hello --type="LoadBalancer" --port 80
- get information after expose deployment
- kubectl get services -o wide

### Step 12
- rolling-update
- kubectl set image deployment <deployment-name> <container-name>=<new-image>
- kubectl set image deployment hello hello=vanph/hello:v2.0.0
- get status after rolling-update
- kubectl rollout status deploy hello    

### Step 13
- check version app that we have
- kubectl rollout history deploy hello
- rollback
- kubectl rollout undo deployment hello --to-revision=1
