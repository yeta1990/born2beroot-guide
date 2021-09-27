

cron job ->

![alt](https://github.com/yeta1990/born2beroot-guide/blob/main/Screen%20Shot%202021-09-22%20at%207.57.22%20PM.png?raw=true)

util:

https://bl831.als.lbl.gov/~gmeigs/scripting_help/printf_awk_notes.txt

monitoring.sh
• The architecture of your operating system and its kernel version.
```
uname -a
```

• The number of physical processors.
```
lscpu | grep Socket | grep -oe '\([0-9.]*\)'
```

• The number of virtual processors.
```
nproc
```

• The current available RAM on your server and its utilization rate as a percentage.
Used memory:
```
free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 2p
```
Total memory:
```
free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 1p
```

• The current available memory on your server and its utilization rate as a percentage.
Used space:
```
df -BM | grep root | grep -o '\([0-9]*\)' | sed -n 2p
```

Total space:
```
df -BG | grep root | grep -o '\([0-9]*\)' | sed -n 1p
```
Space perc:
```
df -BM | grep root | grep -o '\([0-9]*%\)
```

• CPU load:
```
top -n 1 -b | sed -n '8,$'p | cut -c -54 | cut -c 51- | awk 'BEGIN { sum=0 } { sum+=$1 } END {print sum }'
```

• The date and time of the last reboot.
```
who -b | tail -c 17
```

• Whether LVM is active or not.
```
grep -q mapper /etc/fstab
```

• The number of active connections.
```
ss -s | grep -o 'estab [0-9]*' | sed -E "s/^estab //"
```

• The number of users using the server.
```
who | wc -l
```

• The IPv4 address of your server and its MAC (Media Access Control) address.
Server IP:
```
ip a | grep inet | grep global | sed -E "s/    inet //" | sed -E "s/\/(.)*//"
```
Server MAC:
```
ip a | grep link/ether | sed -E "s/    link\/ether //" | head -c 17
```

• The number of commands executed with the sudo program.
```
cat /var/log/sudo/sudo_logs | grep "COMMAND" | wc -l
```


## Broadcast monitoring message to all connected users

- Set cron job from sudo:
```
crontab -e
```

setup new cronjob, using 'wall' to broadcast the message:
each minute
```
* * * * * bash /home/albgarci/monitoring.sh
```

each 10 minutes:
```
*/10 * * * * bash /home/albgarci/monitoring.sh
```


