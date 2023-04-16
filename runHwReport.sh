#!/bin/bash
# Author- Naveen.kulkarni
#Date-
DATELOG=$(date +'%d-%b-%y')
Log=$PWD/hwReport_$DATELOG.csv 
echo "Host Name=OS Version" >> $Log 2>&1
for i in `cat $PWD/server`
do
ssh -q $i 'bash -s' < $PWD/getInfo.sh  >>  $Log 2>&1
done
echo "HI , Please find the `date +%B` Hw report " | mutt -a "/home/naveen/HwReport_$DATELOG.csv" -s "HW Report" -- naveenvk88@gmail.com

