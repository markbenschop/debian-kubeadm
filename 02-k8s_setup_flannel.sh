#!/bin/bash
#
# Installing a single node cluster with kubeadm via procedure as found on 
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
#
echo 'Installing kubernetes with kubeadm' && \
echo 'Adding google apt key' && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo 'Adding kubernetes repo'
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
echo 'Updateing apt cache' && apt-get update && \
echo 'Installing kubelet, kubadm, kubectl' && apt-get install -y kubelet=1.11.3-00 kubeadm=1.11.3-00 kubectl=1.11.3-00 && \
echo 'Hold kubelet, kubeadm, kubectl versions' && apt-mark hold kubelet kubeadm kubectl && \
echo 'Disabling swap' && swapoff -a && \
echo 'Saving /etc/fstab to /etc/fstab.old' && cp /etc/fstab /etc/fstab.old && \
echo 'Generating new fstab' && cat /etc/fstab | grep -v swap > /etc/fstab.new
echo 'Moving new fstab in place' && mv /etc/fstab.new /etc/fstab && \
echo 'Setting up kubernetes with kubeadm' && kubeadm init --pod-network-cidr=10.244.0.0/16 && \
echo 'Creating .kube/config' && \
mkdir -p ${HOME}/.kube && \
sudo cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config && \
sudo chown $(id -u):$(id -g) ${HOME}/.kube/config && \
echo 'Enabling master to run workload' && kubectl taint nodes --all node-role.kubernetes.io/master-
echo 'Installing flannel networking cni' && kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/c5d10c8/Documentation/kube-flannel.yml