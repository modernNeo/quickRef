#!/bin/bash

#adapted from https://medium.com/thomas-strohmeier/setting-up-pam-ssh-agent-auth-for-sudo-login-7135330eb740

sudo useradd -m -d /home/jace -s /bin/bash jace
sudo mkdir /home/jace/.ssh
sudo touch /home/jace/.ssh/authorized_keys
sudo chown -R jace:jace  /home/jace
sudo chmod 700 /home/jace/.ssh
sudo chmod 0600 /home/jace/.ssh/authorized_keys

sudo update-alternatives --set editor /usr/bin/vim.basic

#ask me for my public key

wget "http://downloads.sourceforge.net/project/pamsshagentauth/pam_ssh_agent_auth/v0.10.3/pam_ssh_agent_auth-0.10.3.tar.bz2" -P /tmp

cd /tmp/
tar -xjvf pam_ssh_agent_auth-0.10.3.tar.bz2
cd pam_ssh_agent_auth-0.10.3/
sudo apt-get update
sudo apt-get install -y libssl1.0-dev openssl build-essential checkinstall libpam0g-dev
/tmp/pam_ssh_agent_auth-0.10.3/configure --libexecdir=/lib/security --with-mantype=man
make
sudo checkinstall -y

sudo bash -c "echo \"Defaults        env_keep += SSH_AUTH_SOCK\" >> /etc/sudoers"
sudo bash -c "echo \"Defaults        timestamp_timeout=0\" >> /etc/sudoers"
sudo bash -c "echo \"jace    ALL=(ALL:ALL) ALL\" >> /etc/sudoers"

sudo mv /etc/pam.d/sudo /etc/pam.d/sudo_temp
sudo bash -c "echo \"#%PAM-1.0\" > /etc/pam.d/sudo"
sudo bash -c "echo \"auth       sufficient pam_ssh_agent_auth.so file=/etc/security/authorized_keys debug\" >> /etc/pam.d/sudo"
sudo bash -c "cat /etc/pam.d/sudo_temp >> /etc/pam.d/sudo"

sudo ssh-keygen -t rsa -b 4096 -f /home/jace/.ssh/id_rsa -q -N ""
sudo chown -R jace:jace  /home/jace

sudo cp /home/jace/.ssh/id_rsa.pub /etc/security/authorized_keys

sudo bash -c 'echo eval \`ssh-agent -s\` >> /home/jace/.bashrc'
sudo bash -c "echo ssh-add >> /home/jace/.bashrc"