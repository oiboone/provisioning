# ssh configuration

Ansible can provision remote machies using ssh. This may provide the minimum manually installed footprint for a new system.

## Enable an ssh deamon on the target machine

On target machine, execute:

``` bash
sudo apt update
sudo apt install openssh-server # installs ssh deamon and enables the service
sudo systemctl status sshd  # not strictly needed, but verifies that sshd is working
ip a >ip.txt    # records ip address of target machine
sudo systemctl enable ssh   # This line mihgt be needed to ensure that sshd is restarted on reboot.
```

## Create ssh keypair on master machine if one doesn't already exist

On master machine, execute:

``` bash
mkdir -p ~/.ssh
cd .ssh
ssh-keygen -t rsa
```

You will be asked to provide a password that protexcts your private keyfile.

## Copy public key to target machine

On master machine, execute:

```bash
cd ~/.ssh
sftp target_user@target_ipaddress
sftp>   put id_rsa.pub
sftp>   quit
ssh target_user@target_ip_address
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
cat id_rsa.pub > .ssh/authorized_keys
rm id_rsa.pub
exit
```

At this point you can ssh using the keyfiles, but you will need to use the password for your private keyfile each time.

## Enable automatic login via ssh-agent

Before running ansible, or other programs that need your private keyfile, you can initialize an agent to provide the keyfile. On master machine, execute:

```bash
ssh-agent bash
ssh-add ~/.ssh/id_rsa
```

After these commands are executed, any program executed in that shell will be able to use ssh without further password requests. <http://blog.joncairns.com/2013/12/understanding-ssh-agent-and-ssh-add/>

# 