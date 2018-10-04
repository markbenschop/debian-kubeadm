# Setup a k8s environment on a Debian 9 vm.

Install a debian 9 vm as per instructions in docs/00-INSTALL_DEBIAN_VM.md or use an existing one.


## Configure the vm and install k8s
Log in to the vm with your user account.
Su to root
Install git

    apt-get install -y git

To configure the vm clone this git repository

    git clone https://github.com/markbenschop/debian-kubeadm.git


To install some software and setup your user for passwordless sudo

    ./00-debian_setup.sh ${username}

To install docker (in a slightly older version is supported with k8s)

    ./01-debian_install_docker.sh



Depending whether you want to use flannel or calico network cni.
Flannel is usually fine. It is simple and uses little resources.

    ./02-k8s_setup_flannel.sh
 
or

    ./02-k8s-setup-calico.sh


After this scripts is finished you can check if k8s is running with  

    kubectl get pods --all-namespaces
  
After a minute or 2 you should see about 8 pods with status 'Running'.

To install prometheus into the k8s cluster run 

    ./03-prometheus.sh

Check what is going on with 'kubectl get pods --all-namespaces'. After a few minutes all pods should be running.


