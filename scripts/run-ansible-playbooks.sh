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
# Install standard applications for any user
sudo ansible-playbook standard-desktop.yml
# Install software for audio and video editing
sudo ansible-playbook multimedia.yml
# Install engineering applications
sudo ansible-playbook engineering.yml
# Install software for authoring
sudo ansible-playbook technical-writing.yml