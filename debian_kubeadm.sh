#!/bin/bash
#

echo 'Installing kubernetes with kubeadm' && \
echo 'Adding google apt key' && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo 'Adding kubernetes repo'

echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

echo 'Updateing apt cache' && apt-get update && \
echo 'Installing kubelet, kubadm, kubectl' && apt-get install -y kubelet kubeadm kubectl && \
echo 'Hold kubelet, kubeadm, kubectl versions' && apt-mark hold kubelet kubeadm kubectl && \
echo 'Disabling swap' && swapoff -a && \
echo 'Saving /etc/fstab to /etc/fstab.old' && cp /etc/fstab /etc/fstab.old && \
echo 'Generating new fstab' && cat /etc/fstab | awk '/swap/ {sub("^","#"); print}' > /etc/fstab.new
echo 'Moving new fstab in place' && mv /etc/fstab.new /etc/fstab && \
echo 'Setting up kubernetes with kubeadm' && kubeadm init --pod-network-cidr=192.168.0.0/16 && \
echo 'Creating .kube/config' && \
mkdir -p ${HOME}/.kube && \
sudo cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config && \
sudo chown $(id -u):$(id -g) ${HOME}/.kube/config && \
echo 'Installing calico rbac' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml && \
echo 'Installing calico' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

