#!/bin/bash
#
# Installing a single node cluster with kubeadm via procedure as found on 
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
#
echo 'Adding google apt key' && \
echo 'Adding google apt key' && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo 'Adding kubernetes repo'
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
echo 'Updateing apt cache' && apt-get update && \
# echo 'Installing kubelet, kubadm, kubectl' && apt-get install -y kubelet=1.11.3-00 kubeadm=1.11.3-00 kubectl=1.11.3-00 && \
echo 'Installing kubelet, kubadm, kubectl' && apt-get install -y kubelet kubeadm kubectl
# echo 'Hold kubelet, kubeadm, kubectl versions' && apt-mark hold kubelet kubeadm kubectl 
