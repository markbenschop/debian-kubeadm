# Demo steps

# Setup a Debian 9 vm and install k8s

## Setup a vm
With 2 cpu's, 2gb memory and about 15Gb disk.

## Install vm
Install a debian 9 vm with an administrative user, e.g. username

## Configure the vm and install k8s
Log in to the vm with your user account.
Su to root
Install git

    apt-get install -y git

To configure the vm clone this git repository

    git clone https://github.com/markbenschop/debian-kubeadm.git

cd into the debian-kubeadm directory and run the following scripts.

To install some software and setup your user for passwordless sudo

    ./00-debian_setup.sh ${username}

To install docker (in a slightly older version is supported with k8s)

    ./01-debian_install_docker.sh

To setup k8s using kubeadm

    ./02-debian_setup_k8s_flannel.sh

After this scripts is finished you can check if k8s is running with  

    kubectl get pods --all-namespaces
  
After a minute or 2 you should see about 8 pods with status 'Running'.

To install prometheus into the k8s cluster run 

    ./03-prometheus.sh

Check what is going on with 'kubectl get pods --all-namespaces'. After a few minutes all pods should be running.


############### TODO : connect met prometheus


# Run demo with flask-demo container

## Clone git repository
Clone this git repository
   git clone https://github.com/markbenschop/flask-demo.git

## Run


# Install prometheus
Run the 
