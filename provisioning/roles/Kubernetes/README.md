# Kubernetes (k8s) Ansible Setup

## Overview

Kubernetes (k8s) is a container Management solution. It is used by Google's Open Source Platform to manage cluster and automatically deploy, scale and control operation of application containers. The Kubernetes applications are deployed in form of Docker containers and services. This makes the installation of the applications faster and easier. Additionally, since the Docker containers images are lightweight, it consumes less resources.

+ Pods
+ Replication Controllers
+ Services
+ Deployment

## Containers

The Container is another type of Virtualization which has a smaller overhead.

## Build the Kubernetes cluster using a Vagrant Virtual Machine

Most of the estimates are based on Expert Knowledge and analogy estimation. These techniques not only generate extra work for those designated as experts it also

### Install Kubernetes Cluster (k8s)

**kubectl** It is a _command line utility_. This is the *CLI* utility for the Kubernetes cluster and you need to install it and have it available in your *PATH*.

Install docker with ansible
install **kubectl** with ansible. **kubectl** is the command-line tool for deploying and managing application on Kubernetes. Using **kubectl** could perform the following: Inspect cluster resources

#### Install Kobs

To install Kubernetes Operations (Kobs), we use the following script

```bash
#! Linux
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
```

```Bash
#! Create an AWS S3 bucket for kops to persist its state:
bucket_name=imesh-kops-state-store
aws s3api create-bucket \
--bucket ${bucket_name} \
--region us-east-1

##! Enable versioning for the above S3 bucket:

aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled
```

### Create a new Kubernetes cluster

## Get Encrypted data

How to store the Access Key, Secret Access Key from Amazon encrypted configuration nodejs

## Project Skeleton

### How your Project Unique ID is generated

  One of main concerns of our application is to comply with the GDPR laws. For that reason, we rely on authentication methods from third parties such as Google, Github and Auth0. We do not accept entering personal data except your nickname and Avatar.

#### Do we store personal data

All our fields are scan to detect personal names

### Why Project Classification fields are mandatory

## References

* [Ansible Kubernetes Vagrant Tutorial](https://www.itwonderlab.com/ansible-kubernetes-vagrant-tutorial/)
* [Kafka GUI](https://github.com/tchiotludo/kafkahq)
* [Kafka Manager](https://github.com/yahoo/kafka-manager)
