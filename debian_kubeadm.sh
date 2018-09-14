#!/bin/bash
#

echo 'Installing kubernetes with kubeadm'
echo 'Adding google apt key' && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'Adding kubernetes repo' && \
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
echo 'Updateing apt cache' && apt-get update
echo 'Installing kubelet, kubadm, kubectl' && apt-get install -y kubelet kubeadm kubectl
echo 'Hold kubelet, kubeadm, kubectl versions' && apt-mark hold kubelet kubeadm kubectl
echo 'Setting up kubernetes with kubeadm' && kubeadm init --pod-network-cidr=192.168.0.0/16
echo 'Waiting a while' && sleep 30
echo 'Installing calico rbac' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
echo 'Installing calico' && kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

