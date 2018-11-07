
#!/bin/bash

echo 'Deploy traefik' 
kubectl apply -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/traefik-deployment.yaml
echo 'Create an ingress rule for traefik webgui'
kubectl apply -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/ui.yaml
