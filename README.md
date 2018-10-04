# debian-kubeadm
Scripts to install k8s on a Debian 9 system for quick k8s tests

For personal use so *not for any type of production use* !!!!

The scripts will quickly install docker and set up a kubernetes master that can run containers.

# Use 

    00-debian_setup.sh ${username}


    01-debian_install_docker.sh

Depending if you want to use flannel or calico network cni choose :

    02-k8s_setup_flannel.sh

or

    02-k8s_setup_calico.sh

To setup prometheus

    03-prometheus.sh
