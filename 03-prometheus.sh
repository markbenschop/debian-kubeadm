#!/bin/bash

DIR='prometheus-operator/contrib/kube-prometheus/manifests/'
git clone https://github.com/coreos/prometheus-operator.git 

if [ -d "${DIR}" ]
         kubectl create -f ${DIR} || true
         kubectl create -f ${DIR}/ 2>/dev/null  || true
fi
