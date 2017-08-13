#!/usr/bin/env bash
# Usage:
#   setup-remote server
server=$1

ssh-copy-id root@$server
ssh root@$server " \
adduser --disabled-password --quiet $USER \
echo "$USER ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/$USER \
cp -r .ssh /home/$USER \
chown -R $USER $USER /home/$USER/.ssh \
"
ssh $USER@server "git clone https://github.com/crzidea/confbook.git ~/.confbook && ~/.confbook/install.sh"
