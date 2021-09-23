

cron job ->

![alt](https://github.com/yeta1990/born2beroot-guide/blob/main/Screen%20Shot%202021-09-22%20at%207.57.22%20PM.png?raw=true)

monitoring.sh
• The architecture of your operating system and its kernel version.
```
uname -a
```

• The number of physical processors.
```
lscpu
```

• The number of virtual processors.
```
nproc
```

util:

https://bl831.als.lbl.gov/~gmeigs/scripting_help/printf_awk_notes.txt

• The current available RAM on your server and its utilization rate as a percentage.

• The current available memory on your server and its utilization rate as a percentage.


• The current utilization rate of your processors as a percentage.
• The date and time of the last reboot.
• Whether LVM is active or not.
• The number of active connections.
• The number of users using the server.
• The IPv4 address of your server and its MAC (Media Access Control) address.
• The number of commands executed with the sudo program.

cron


* * * * * bash jkasdfjkalsñ | wall

