# born2beroot-guide

1. Install debian on virtual box
2. Configure sudo https://geekytheory.com/solucion-al-problema-sudo-command-not-found-en-linux
```
apt-get install sudo

adduser albgarci sudo
```
if adduser doesn't work:
```
$ sudo nano ~/.bashrc

export PATH="$PATH:/usr/sbin/"
```
and reload: 
```source ~/.bashrc
```

```
groupadd user42
```
(alt + 124) to write a pipe

```
adduser albgarci user42
```
to check if albgarci is in user42 group
```
getent group | grep user42
groups albgarci
```

to create a new user
```
sudo adduser testinguser
```

to assign that user to a group
```
adduser probandouser user42
```

to delete a specific user
```
sudo deluser probandouser
```

##ssh

https://linuxhint.com/enable-ssh-server-debian/

```
sudo systemctl status ssh
```


it's currently working on port 22

to change ssh port from 22 to 4242:
```
find / -name "sshd_config"
```

edit config file
```
sudo vi /etc/ssh/sshd_config
```

change on line 15
```
#Port 22 to Port 4242
```

now we have to restart the ssh server
```
sudo systemctl stop ssh
sudo systemctl start ssh
```

or 
```
service ssh restart
```

to check if ssh is running on port 4242
```
ss -tulpn | grep 4242
``` 

or 
```
sudo systemctl status ssh
```

and confirm that port 22 isn't serving ssh


```
ss -tulpn | grep 22
```

disable ssh connections to root user: vi edit /etc/ssh/sshd_config, check that "PermitRootLogin" is disabled (line 34) or commented, and add:
```
PermitRootLogin no
```


##firewall setup
https://dev.to/delightfullynerdy/bash-ufw-command-not-found-ubuntu-18-04-1agh

```
sudo apt-get install ufw
```
typing...
```
sudo ufw status
```
we can't see any allowed port

but enabling ufw and allowing a specific port:
```
sudo ufw enable
sudo ufw allow 4242/tcp 
sudo ufw status
```
4242 port is now enabled

to check which ports are open
```
sudo lsof -nP -i | grep LISTEN
```

before connecting from the "real" computer to virtual box, we must enable the 4242 port in virtualbox
```
settings->network->port forwarding. guest and host port 4242. host ip 127.0.0.1
```

connect from "real" to virtual
```
ssh albgarci@localhost -p 4242
```

to check which users are currently connected to server
```
who -a
```


##change hostname

two steps:
1. change hostname
```
hostname [newname]
```
for example
```
hostname albgarci42
```
or 
```
hostname server2
```

check it with 
```
hostname
```

2. change /etc/hosts
```
vi /etc/hosts
```
and edit the line 127.0.1.1 to the correct one

3. after panicking for 2 hours, i've found that it's also necessary to change the /etc/hostname file
```
vi /etc/hostname
```
and replacing the name for the one you chose

##differences between apparmor and selinux
[Stackexhange](https://security.stackexchange.com/questions/29378/comparison-between-apparmor-and-selinux)
[Other](https://www.sololinux.es/apparmor-vs-selinux/)



