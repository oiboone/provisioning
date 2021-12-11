---
title: Initial Manual Software Setup for a Linux Desktop Machine
author: Jeff
date: 2021-04-06
---
#

Before installing the OS, think about network connections and software. If you have a wired conneciton, proceed as shown below. If you only have a wifi connection, you need to have local copies of the wifi deb files you need from the repository for your distribution. To do this, ideally you can start with a machine already running the distribution you plan to use. If so:

1. sudo apt-get clean   # to clear out the archive directory
2. sudo apt-get --download-only install wpasupplicant
3. Copy files from /var/cache/apt/archives to a flash drive
4. After the new machine's OS is installed, mount the flash drive.
5. cd to the mounted drive.
6. sudo dpkg -i libnl-route-3–200_3.4.0–1_amd64.deb libpcsclite1_1.8.26–3_amd64.deb wpasupplicant_2.9–1ubuntu4_amd64.deb
7. ls /sys/class/net | grep -i wlp  # to identify the wifi device


If the machine already has these packages installed, you can repackage them for copying to the new machine by:

sudo apt install -y dpkg-repack
sudo dpkg-repack wpasupplicant libnl-route-3–200 libpcsclite1

On the other hand, you can download the files themselves from:

wpasupplicant: client support for WPA and WPA2 (IEEE 802.11i).
http://mirrors.kernel.org/ubuntu/pool/main/w/wpa/wpasupplicant_2.9-1ubuntu4_amd64.deb

libnl-route-3–200: library for dealing with netlink sockets — route interface.
http://mirrors.kernel.org/ubuntu/pool/main/libn/libnl3/libnl-route-3-200_3.4.0-1_amd64.deb

libpcsclite1: middleware to access a smart card using PC/SC (library).
http://mirrors.kernel.org/ubuntu/pool/main/p/pcsc-lite/libpcsclite1_1.8.26-3_amd64.deb

# OS Installation

## Background

Update 2021-05-13 

I found that Neon is not very compaitble with apps in Ubuntu that require a particular version of Qt. As a result, I decided to shift my base system to Ubuntu server. This has the additional advantage that by default, Ubuntu server installs an ssh deamon.

## Installation

1. Download desired version of Ubuntu server as iso.
2. Download sig file
3. Verify signature of iso file
4. Burn iso file to DVD via k3b (or create flash drive?)
5. Boot new system from DVD or flash drive 
6. Install Ubuntu server to system drive
7. Remove boot media and boot from system drive
8. create a provisioning directory (mkdir ~/provisioning)
9. In the provisioning directory, record the initial set of installed packages (cd provisioning; dpkg-query -l >ubuntu-initial-packages.txt
10. Also record disk useage df>ubuntu-initial-df.txt

Original 2021-04-06:

I am using KDE Neon as my base distribution for desktop machines. KDE Neon is based on an Ubuntu LTS (Long term support) release. To this base, KDE adds .deb repos for current versions of KDE software. This provides a stable operating system and more recent versions of the GUI and some apps. It's a relatively lightweight ubuntu based distribution (similar RAM use to Xubuntu). I like the KDE desktop for a number of reasons <https://www.fosslinux.com/41109/top-10-reasons-to-use-kde-as-your-desktop-environment.htm>

Ubuntu has regular releases every 6 months (in April and October). Long term support releases occur every 2 years in April (eg. 18.4, 20.4). Ubuntu LTS versions are based on Debian Testing releases with additional software from other repositories.

At any particular time, Debian has three releases. Debian Unstable (Sid) contains the most recent versions of software and often breaks. Debian testing is a snapshot of debian unstable that is being stabalized for the next stable release. Debian Stable is insanely stable but typically has outdated software. Debian is comunity based and only includes free software. Proprietary software must be added. Debian also has releases based on kernels other than Linux and supports many architectures. <https://www.debian.org/intro/index#software>

## Installation

1. Download desired version of KDE Neon <https://neon.kde.org/> as iso.
2. Download sig file
3. Verify signature of iso file
4. Burn iso file to DVD via k3b (or create flash drive?)
5. Boot new system from DVD or flash drive (use nomodeset or safe graphics mode if there is no graphic output)
6. Connect to network
6. Use installation tool on boot media to install Neon to system drive
7. Remove boot media and boot from system drive
8. create a provisioning directory (mkdir ~/provisioning)
9. In the provisioning directory, record the initial set of installed packages (cd provisioning; dpkg-query -l >neon-initial-packages.txt
)
10. Change GRUB configuration for easy reboot if reconfiguration fails
    1. edit grub defaults (cd /etc/default; sudo su; nano grub)
    2. change menu style (GRUB_TIMEOUT_STYLE="menu"
    3. lengthen timeout (GRUB_TIMEOUT=30)
    4. Add Grub tune so we know we've entered grub (GRUB_INIT_TUNE="480 440 4 440 4 440 4 349 3 523 1 440 4 349 3 523 1 440 8")
    5. Save file, update grub, and exit root shell (ESC,C-O,C-X, update-grub, exit)
11. Connect to local network
12. If running using nomodeset, 
    1.  identify required video driver (ubuntu-drivers devices) and record name of recommended driver
    2.  Install recommended driver (e.g. sudo apt install nvidia-driver-460)
    3.  record updated package list (dpkg-query -l >neon-with video-driver-packages.txt)
    4.  reboot
13. Once the boot process is stable, change GRUB configuration for faster reboot
    1. edit grub defaults (cd /etc/default; sudo su; nano grub)
    2. change menu style (GRUB_TIMEOUT_STYLE="menu"
    3. lengthen timeout (GRUB_TIMEOUT=5)
    4. Remove Grub tune so we know we've entered grub (GRUB_INIT_TUNE="480 440 4 440 4 440 4 349 3 523 1 440 4 349 3 523 1 440 8")
    5. Save file, update grub, and exit root shell (ESC,C-O,C-X, update-grub, exit)

# Bring base system up to date before provisioning

1. Connect to network
2. Update all

# Prepare for automated provisioning

Initial scripts can either be copied over to the target system via USB drive or network shared directory or included in the bootable distribution source.

## If system will serve as an ansible master for future desktop provisioning

In this case, use the ansible-setup.sh script to:
* install git and ansible
* Use git to clone this directory tree
* Use ansible to download prerequiste roles
* Use ansible to run provisioning playbooks on localhost
  
## If one wishes to have minimal manual installations

Use ssh-install.sh to install an ssh deamon. Add the new target machine to the inventory.yml file. Then run ansible on a master computer to provision the target machine via ssh.
