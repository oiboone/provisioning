#!/bin/bash
#
# Copy this file to the target and make it executable: chmod +x ./ssh_install.sh
# or simply execute individual lines by hand
#
# We have to manually install ssh to bootstrap the ansible provisioning process
sudo apt update
sudo apt install openssh-server
#
# Check that the ssh server has started up
sudo systemctl status ssh
#
# Find the ip address of the new machine in order to communicate wiht it.
hostname -I
# or alternatively 
# ip a >ip.txt
#
# or alternatively for machines at home, we can find the hostname via:
# hostname
# and then ssh in locally at home using ssh username@hostname.local
