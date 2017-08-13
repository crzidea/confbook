#!/usr/bin/env bash
# Usage:
#   ./install-remote.sh server
set -x
server=$1
ssh-copy-id root@$server
ssh root@$server "
hostname $server
echo $server >/etc/hostname
adduser --disabled-password --gecos '' $USER
echo \"$USER ALL=(ALL) NOPASSWD:ALL\" >/etc/sudoers.d/$USER
cp -r .ssh /home/$USER
chown -R $USER:$USER /home/$USER/.ssh
apt update
apt install -y git
"
ssh $USER@$server "
git clone https://github.com/crzidea/confbook.git ~/.confbook
~/.confbook/install.sh
"
