#!/bin/bash
echo "Broadcast message from .... (user@server) (???tty???) (date):"

echo -n "#Architecture: "
uname -a;
echo "#CPU physical : $(lscpu | grep Socket | grep -oe '\([0-9.]*\)')"
echo "#vCPU : $(nproc)"
used_memory=$(free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 2p)
total_memory=$(free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 1p)
#echo "$available_memory"
#memory_percentage=$(used_memory + 0 / 0 + total_memory * 100)
echo -n "#Memory Usage: $used_memory/${total_memory}MB ("
#echo -n "MB ("
echo $used_memory $total_memory | awk '{printf "%.2f", $1 / $2 * 100}'
echo "%)"
used_space=$(df -BM | grep root | grep -o '\([0-9]*\)' | sed -n 2p)
total_space=$(df -BG | grep root | grep -o '\([0-9]*\)' | sed -n 1p)
space_perc=$(df -BM | grep root | grep -o '\([0-9]*%\)')
echo "#Disk Usage: $used_space/${total_space}Gb ($space_perc)"
echo "#CPU load: "
echo "#Last boot: "
echo "#LVM use: "
echo "#Connexions TCP : "
echo "#User log:"
echo "#Network: "
echo -n "#Sudo: "
#sudo cat /var/log/sudo/sudo_logs | grep "COMMAND" | wc -l
