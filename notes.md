# Outline
* What are containers? What is Docker? 
* Why do you need it? What can it do? 

<br/>

* How to run Docker containers?
* Create Docker images
* Networking in Docker
* Docker Compose

<br/>

* What is Docker registry?
* How to Deploy you own private registry

<br/>

* Docker concepts in depth
* How Docker really works under the hoods

<br/>

* Docker for Windows/Mac

<br/>

* Container orchestration
* Docker Swarm
* Docker vs. Kubernetes

<br/>

# Why do you need Docker? 

* Version hell
* Dependency hell
* Platform hell

<br/>

* The compatibility matrix: **Matrix from Hell**

<br />

* Setting up different dev environments
* Different Dev/Test/Prod environments

<br/>

* Docker (container technology) solves these problems by providing something like light-weight virtual machines. 


# What are containers?

* Completely isolated environments all sharing the same OS Kernel
* Each container has its own isolated Processes, Network interfaces, Mounts, ...
* Just like virtual machines, but they all share the same OS Kernel. 

<br/>

* Containers are not a new concept. They existed now for about 10 years. Tools like Docker offer an easy to use over complex container technology. 
* Docker use LXC (Linux Containers)


<br/>

* OS actually consists of an OS kernel, an a set of software on top of it:
  * OS kernel is responsible for communicating with underlying HW. 
  * The software uses OS kernel
  * Docker uses the OS Kernel, and isolates the software on top of that. 

## Differences between VMs and Containers
* VM: HW - Hypervisor - OS (including kernel and software on top of it)
  * Heavy and GB in size.
  * Takes long to boot
  * Complete isolation from each other
  * Different OSs on the same Hypervisor and HW

<br/>

* Container: HW - OS (kernel) - Docker - Software 
  * Lightweight, MB in size
  * Boots up very fast
  * Less isolation, as more resources are shared (e.g. kernel) between containers.
  * The containers contain the software for the same OS (e.g. Linux)

# Containers vs. Images
* An images is a package or template used for creating one or more containers

* A Container is a running instance of an image
  * It is isolated
  * Has its own environment and setup processes
  * You can create many container instances from the same image

* A lot of products are already containerized and are available on Docker Hub
* You can also crate your own images and upload them to the Docker Hub

## Docker in DevOps
* Prior to Docker, the developers developed the application and then handed it to the operations, who were responsible for configuring and deploying the application. The operations often struggled with deployment, because the configuration were not the same as the developers machine.
* With Docker the developers can already create a **Dockerfile** that describes the configuration of the software and all it needs (environments, libraries, resources, ...). 
* This Docker file is used to crete an image that is then used to create containers everywhere that are exactly identical to the development configurations. 

# Docker: Getting Started
* Docker has two editions: Community Edition, and Enterprise Edition

<br/>

* Remove previous version
  
```
$ sudo apt-get remove docker docker-engine docker.io containerd runc

```

* Install Docker: 

```bash
## Update apt package index and installed required packages for apt over HTTPS:

$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

## Add Docker's official GPG key and verify its finger print 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88:

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]

## Add Docker repository:

$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


## Install Docker Engine:

 $ sudo apt-get update
 $ sudo apt-get install docker-ce docker-ce-cli containerd.io

## Verify installation:

$ sudo docker version


$ sudo docker run hello-world

```

## A simple example: 

```bash
$ sudo docker run docker/whalesay cowsay Hello-World!

 ______________ 
< Hello-World! >
 -------------- 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/   

$ 
```

* By running this command, the Docker **pulls the images of the whalesay** from **Docker Hub** and runs it. 

# Some Docker Commands

* `docker run`

Is used to run a container from an image. 

For example running the `docker run nginx` command will run an instance of the `enginx` application from the image the **docker host** (the computer running the docker daemon), if it already exists. If the image does not exist on the docker host, it will first go out to the Docker Hub and pull the image down. This is only done for the first time. For the subsequent executions, the same image will be reused. 

* `docker ps`

List all the running containers, with some information about them, such as container id, the name of the image used to run the container, the current status, and the name of the container. 
Each container automatically gets a random id and name assigned to it by Docker. 

* `docker ps -a`
  
To see all containers running, as well as previously stopped or exited containers. 

* `docker stop <container_name>` or `docker stop <container_id>`

Stop a running container

* `docker rm <container_name>`

Remove a stopped or exited container. Returns the name of the container on success

* `docker images`

List of images on the host and their sizes. 

* `docker rmi <image_name>`

Remove the image from host. IMPORTANT: make sure that no container is running off that image. You must stop and delete all dependent images. 

* `docker pull <image_name>`

Pulls the image down from Docker Hub, so that you don't have to wait for it, when calling `docker run` for the first time. 

## Running command in Container

* 
