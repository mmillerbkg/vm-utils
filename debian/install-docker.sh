#!/bin/zsh

# Remove old version if applicable
apt remove docker docker-engine docker.io containerd runc

apt install lsb-release

wget -O /tmp/docker-keyring.gpg https://download.docker.com/linux/debian/gpg

gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg /tmp/docker-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update && apt install -y docker-ce docker-ce-cli containerd.io

usermod -aG docker mmiller

# Install docker compose
wget -O /usr/libexec/docker/cli-plugins/docker-compose "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)"

chmod +x /usr/libexec/docker/cli-plugins/docker-compose
