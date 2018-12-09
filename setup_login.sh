#!/bin/bash

#adapted from https://medium.com/thomas-strohmeier/setting-up-pam-ssh-agent-auth-for-sudo-login-7135330eb740

sudo useradd -m -d /home/jace -s /bin/bash jace
sudo mkdir /home/jace/.ssh
sudo touch /home/jace/.ssh/authorized_keys
sudo chown -R jace:jace  /home/jace
sudo chmod 700 /home/jace/.ssh
sudo chmod 0600 /home/jace/.ssh/authorized_keys

sudo update-alternatives --set editor /usr/bin/vim.basic

sudo bash -c "echo \" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDG7Wq4j/1AK0L7mVqCnbFcmozV7F17KmbJxWTvSQ6/cyPNarXgQ+2HEwJ4p2dcRPmFQbGQs55Ykiv0ge5Ioj3htf2sePV6vChzjD/KF3ltSemmMdweJWUhzt7TLGu6ldsX2ntXuzqBw67/EoDXnIYxylJjLCyOTN4L16yMIqJKowi0xQKVwdL8Z4I0H8ypvAWbwxj326QMqycpeXK1AsjzOsupPEBlTUgvJn30TeFIXWcGK4jl1oNdRVIKsR+BfLMGTcL7u4nGSpNE2p7fe37ApAkR4OwoSMo3v0NAnTuuvyGkeLWe0+6JC92w41QvidEaW+kJnt0qZTmMG6+Zb3avSPrjnMXD9iJcmsKooL6qytqHMLy4Si8hmEpkdQl/BcFluKG02N6pXH5lVR11wmrBBmd1nEebEHGG3AYA2DQbxBCgl5bjiVOzjwX976KRCZml24mHabvN0weiG8cMcF3mcajvlHwK5nDIviVcdaqAbCcqQeds+22UFTYr5hQ0gQNnyz/o6k4KZA/nJYGhpGDthy+KucLjTHOSeimmwqC4fncrdeg9n5I5wx7m8MzR5Txxh0awqg2PMrX4VqEpuNo4soebm2nit+yVCA3QFutDpA8HpS+RbiOMA0RX8Otdc4zl3RYoE9LILyNWzZ5JP/CRKEYbC/SkYxliCOZNdQkQQ== jace@jace_arch\" >> /home/jace/.ssh/authorized_keys"

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
