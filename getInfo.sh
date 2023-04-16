#!/bin/bash
# Author- Naveen.kulkarni
#Date-

srvName=$(uname -n)
osVer=$(cat /etc/redhat-release)
sysRom=$(dmidecode -t bios|grep "Release Date" |awk '{print $3 "="}' )
frmVer=$(dmidecode | grep "Firmware Revision"  |awk '{print $3 }')
prdName=$(dmidecode -t system|grep -i Product |awk '{print $3$4$5$6 "="}')

echo -n $srvName  "=" | tr -d '\n'; echo -n $osVer  "=" | tr -d '\n'; echo -n $prdName | tr -d '\n'; echo -n $sysRom  | tr -d '\n'; echo -e $frmVer | tr -d '\r'
echo -n $srvName  "=" | tr -d '\n'; echo -e $osVer   | tr -d '\r';
hwInfo=(srvName osVer sysRom frmVer prdName)
for HwInfo in "${hwInfo[@]}"
do
echo -n $HwInfo "=" | tr -d '\n'
done

