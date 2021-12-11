#!/bin/bash
#
# copy this file to the master machine and make it executable: chmod +x ./install.sh
# 
#
# We have to manually install git and ansible to bootstrap the process
sudo apt install -y git
sudo apt install -y ansible
# clone the git repository with the provisioning files
# This puts the files in a subdirectory named desktop-config
sudo git clone https://github.com/oiboone/desktop-config
# move into ansible subdirectory
cd desktop-config/ansible
# Download roles from ansible galaxy
sudo ansible-galaxy install -r requirements.yml
