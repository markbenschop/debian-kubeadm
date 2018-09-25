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

echo 'Installing packages' && apt-get install -y sudo vim git curl && \
echo "Adding $user to sudo group" && usermod -a -G  sudo $user && \
echo 'Removing nano' && apt-get -y remove --purge nano && \
echo 'Configuring sudo to NOPASSWD for sudo group' && \

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
