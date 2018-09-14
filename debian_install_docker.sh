#!/bin/bash
#

echo 'Enabling ipv4 forwarding' && \
cat <<EOF > /etc/sysctl.d/ipv4_forward.conf
net.ipv4.forward.all=1
EOF
echo 1 > /proc/sys/net/ipv4/ip_forward

echo 'Removing docker.io' && \
apt-get remove docker docker-engine docker.io

echo 'Installing docker dependencies' && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
echo 'Addeing docker gpgp key' && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'Adding docker repository' && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $( lsb_release -cs) stable"
echo 'Updating apt cache' && apt-get update
echo 'Installing docker-ce' && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep 17.03 | head -1 | awk '{ print $3}')
echo 'Hold docker version' && apt-mark hold docker-ce

