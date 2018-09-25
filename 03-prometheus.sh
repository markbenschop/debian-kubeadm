#!/bin/bash

git clone https://github.com/coreos/prometheus-operator.git && \
if [ -f prometheus-operator/contrib/kube-prometheus ]
   then
   cd  prometheus-operator/contrib/kube-prometheus
     if [ -d manifests ]
     then
         kubectl create -f manifests/ || true
         kubectl create -f manifests/ 2>/dev/null  || true
     fi
 fi
