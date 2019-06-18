#!/bin/bash
#
# Installing a single node cluster with kubeadm via procedure as found on 
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
#
echo 'Setting up kubernetes with kubeadm with flannel cni' && sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address 0.0.0.0 && \
echo 'Creating .kube/config' && \
mkdir -p ${HOME}/.kube && \
sudo cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config && \
sudo chown $(id -u):$(id -g) ${HOME}/.kube/config && \
echo 'Installing flannel networking cni' && kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml && \
echo 'Sleeping 10 secs' && sleep 10 && \
echo 'Enabling master to run workload' && kubectl taint nodes --all node-role.kubernetes.io/master-
