#!/bin/bash

# this script is used for the servers I spin up on digitalocean which wont let me create a new server with a non-root user
# and its bad practice to really do any commands as root

sudo useradd -m -d /home/jace -s /bin/bash jace
sudo mkdir /home/jace/.ssh
sudo touch /home/jace/.ssh/authorized_keys
sudo chown -R jace:jace  /home/jace
sudo chmod 700 /home/jace/.ssh
sudo chmod 0600 /home/jace/.ssh/authorized_keys
cat ~/.ssh/authorized_keys >> /home/jace/.ssh/authorized_keys
echo 'jace ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
sudo apt-get install -y vim
sudo update-alternatives --set editor /usr/bin/vim.basic