#!/bin/bash
#
# Copy this file to the target and make it executable: chmod +x ./install.sh
# or simply execute individual lines by hand
#
# We have to manually install git and ansible to bootstrap the process
sudo apt install -y git
sudo apt install -y ansible
# clone the git repository with the provisioning files
# This puts the files in a subdirectory named desktop-config
sudo git clone https://github.com/oiboone/desktop-config
# Now execute installation scripts from repo