#!/bin/bash
#
usage() {
  echo 'Please specify the user that has administrative rights'
  exit 1
}

start_message() {
	echo 'This script prepares a debian system for usage with ansible'
}

start_message

if [ $# -lt 1 ]
  then 
    usage
  else
    user=$1
fi
echo "user is $user"
# exit 0  

echo 'Installing sudo' && apt-get install sudo && \
echo "Adding $user to sudo group" && usermod -a -G  sudo $user && \
echo 'Instaling vim' && apt-get install -y vim && \
echo 'Removing nano' && apt-get -y remove --purge nano && \
echo 'Configuring sudo to NOPASSWD for sudo group' && \
echo 'Installing git' && apt-get install -y git && \

cat <<EOF > /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults  env_reset
Defaults  mail_badpass
Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root  ALL=(ALL:ALL) ALL

# Allow members of group sudo to execute any command
%sudo  ALL=(ALL:ALL) NOPASSWD:ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
EOF


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
echo 'Installing docker-ce' && apt-get install -y docker-ce=18.03.1~ce-0~debian
