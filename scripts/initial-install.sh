#!/bin/bash
#
# copy this file to the target and make it executable: chmod +x ./install.sh
# or simply execute individual lines by hand
#
# We'll create a tree to keep all the ansible files 
mkdir desktop-config
cd desktop-config
# We have to manually install ansible to bootstrap the process
sudo apt install -y ansible
# Download roles from ansible galaxy
sudo ansible-galaxy install -r requirements.yml
# Install packages from ubuntu repositories
sudo ansible-playbook local.yml
# Install packages from ppa repositories
sudo ansible-playbook zotero.yml
sudo ansible-playbook veracrypt.yml
# Install and configure visual studio code using role
sudo ansible-playbook vscode.yml
# copy config files files
sudo ansible-playbook config.yml