# born2beroot-guide

1. Install debian on virtual box
2. Configure sudo https://geekytheory.com/solucion-al-problema-sudo-command-not-found-en-linux

apt-get install sudo
adduser albgarci sudo

if adduser doesn't work:
$ sudo nano ~/.bashrc
export PATH="$PATH:/usr/sbin/"
