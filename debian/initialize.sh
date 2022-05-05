#!/bin/bash

apt update && apt upgrade -y

apt install -y wget apt-transport-https ca-certificates gnupg2 ufw git 

echo "UFW installed, remember to add rules!"

apt install -y fail2ban && systemctl enable fail2ban

git clone https://github.com/mmillerbkg/vm-utils.git && cd vm-utils/debian

cp ./fail2ban.conf /etc/fail2ban/fail2ban.local && cp ./jail.conf /etc/fail2ban/jail.local

systemctl enable fail2ban

echo "Fail2ban installed and enabled!"

apt install -y apt-listchanges unattended-upgrades

# Update Timezone
timedatectl set-timezone US/Central

# Update hostname
#if [ -z "$1" ]; then
#    echo "Hostname was not set, remember to set using hostnamectl!!"
#    else
#        hostnamectl set-hostname "$1"
#fi

# Install doas
# Change to root dir
cd ~
## Install build tools
apt install -y make cmake gcc g++ flex tar bison
git clone https://salsa.debian.org/debian/doas.git

cd ~/doas

./configure --with-timestamp && make && make install