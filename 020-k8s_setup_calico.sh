#!/bin/bash
#
# Installing a single node cluster with kubeadm via procedure as found on 
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
#
echo 'Setting up kubernetes with kubeadm with calico network cni' && kubeadm init --pod-network-cidr=192.168.0.0/16 && \
echo 'Creating .kube/config' && \
mkdir -p ${HOME}/.kube && \
sudo cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config && \
sudo chown $(id -u):$(id -g) ${HOME}/.kube/config && \
echo 'Enabling master to run workload' && kubectl taint nodes --all node-role.kubernetes.io/master-
echo 'Installing calico rbac' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml && \
echo 'Installing calico' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
