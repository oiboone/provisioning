# Overview

Built 2 machines - one for work one for home.

Home machine (box) based on AMD Ryzen 5 5600x 6 core 12 thread processor and gigabyte X570 Aorus ultra motherboard with 16 GiB of DDR4 3200 MHz DRAM and 500 GB and 1 TB nvme ssd's.

Work machine (deselby) based on same AMD Ryzen 5 5600x 6 core 12 thread processor but using gigabyte X570 UD motherboard with 16 GiB of DDR4 3200 MHz DRAM, a 1TiB nvme ssd and a 1 TiB hdd.

Oriignally used KDE neon distribution but found incompatibilities with the version of Qt used. Particularly with freecad and clementine.

Old hdd was starting to fail so I formatted the 1 TB ssd as a single big ext4 partition for local data files and mounted as ~/files.

Switched to Ubuntu Server 21.04 for work machine (deselby) and developed plasma-desktop.yaml to configure it. Worked well but found several small things to add. Big problem when using ubuntu server with home machine is that wifi isn't supported by server version of OS. Found that to enable wifi I had to:

0. Download local copy of required deb files
1. Update the kernel to Ubuntu 5.11.0-17.18-generic 5.11.12
2. Install wpasupplicant and its dependencies
3. Install network-manager and its dependencies (may not be needed)
4. Set up wifi connection
5. Replace netplan configuration file

# Detailed Instructions

1. Download mainstream kernel version 5.11.12 from https://kernel.ubuntu.com/~kernel-ppa/mainline/ to local ~/files/os-setup/kernel directory
2. Download wpasupplicant and its dependencies to ~/files/os-setup/wpasupplicant
3. Download network-manager and its dependencies to ~/files/os-setup/network-manager
4. Install ubuntu server on open partition
5. Boot ubuntu server in recovery mode (since network isn't available)
6. In kernel directory "dpkg -i *.deb"
7. reboot into recovery mode
8. lshw -c network  and make sure wifi is not shown as unclaimed
9. In wpasupplicant directory "apt install ./blahblahblah.deb with wpasupplicant last
10. "ls /sys/class/net | grep -i wlp" to get id of wifi device
11. Create the netplan file:



sudo netplan --debug generate

If everything is in order, apply the configuration provided for use:

sudo netplan apply

Now, reboot the server:

sudo reboot


# Set up efi

1. create subdirectory in /boot/efi/EFI directory (/boot/efi is a fat32 partition marked Boot in partition manager) e.g. neon
2. efibootmgr -v to print current efiboot order.
3.efibootmgr -c -d /dev/sda -p 2 -L neon -l /EFI/neon/shimx64.efi

In the end decided to stay with KDE NEON for home.

