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
