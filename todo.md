# Ansible 2021

## todo
Finish moving stuff to new provisioning directory
Use variables to make standard_desktop playbook more universal rather than commenting out apps not needed.
Include plays for adding LaTeX packages
Finish standard packages for desktop
Decide what to do with python/anaconda - understand virtual environments
Fix arduino script to automate final manual step
include code to check if arduino is currently installed
Look at molecule to test roles <https://molecule.readthedocs.io/en/latest/>
figure out how to make latex and some other installations idempotent
figure out why freecad is not installing?

## Done
Use ssh to provision new machine
Provision standard desktop apps
Use config file to set defaults
Use vault to hold secrets
Look at ways to specify one machien rather than commenting out entries in host inventory - add group 'active' and make that the selected host group in playbooks.
Put new stuff under git version control

# kubuntu 20.04 install

is sudo apt install gnome-keyring needed?
using variables and vault for username, password, ip address for raspberry pi, etc.
shell script for installing ansible, running ansible galaxy, running ansible-playbook
activate encfs automatically
anaconda
rstudio
create inventory file for localhost
unattended-upgrade?
check 16.04 installation for other programs to install
docker?
pidgin 
gufw,ufw, iptables
what about wine and dosbox?
digikam

# planning

long term - how to organize files in home directory

# ansible

ansible-pull


# git

## done 
Develop simple workflow
document workflow in git.md

# general



# Software to consider adding

julia
calibre
peek or obs
digicam or other photo management
falkon
dropbox
wireshark
kodi
brasero
bombono
