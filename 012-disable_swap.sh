#!/bin/bash
#
# Installing a single node cluster with kubeadm via procedure as found on 
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
#
echo 'Disabling swap' && swapoff -a && \
echo 'Saving /etc/fstab to /etc/fstab.old' && cp /etc/fstab /etc/fstab.old && \
echo 'Generating new fstab' && cat /etc/fstab | grep -v swap > /etc/fstab.new
echo 'Moving new fstab in place' && mv /etc/fstab.new /etc/fstab 
