#!/bin/bash -e
set -e

################################################################################################
## TO INSTALL PYYTHON3.6 ON UBUNTU 14.04 OR 16.04 FOLLOW THE STEPS ON THIS STACKOVERFLOW PAGE ##
## https://askubuntu.com/a/865569                                                             ##
################################################################################################

## THIS SECTION ENSURES THE CORRECT PYTHON3 VERSION [3.6.3] AND PIP [9.0.1 from /usr/local/lib/python3.6/dist-packages (python 3.6)] ARE INSTALLED
# extracted from this asnwer on stackoverflow https://stackoverflow.com/a/44254088
sudo add-apt-repository ppa:jonathonf/python-3.6 -y
sudo apt-get -y update
sudo apt-get install -y python3.6 python3.6-dev python3.6-venv
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py

## This section is for adding in google chrome and its drivers to vagramt as wel as selenium to interact with chrome
cd /vagrant
sudo pip install selenium
wget https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
sudo mv chromedriver  /usr/bin
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo '# needed for installing google-chrome' >> /etc/apt/sources.list
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable
sudo python3.6 -m pip install -r requirements.txt

wget http://selenium-release.storage.googleapis.com/3.8/selenium-server-standalone-3.8.1.jar
sudo mv selenium-server-standalone-3.8.1.jar /usr/local/bin/