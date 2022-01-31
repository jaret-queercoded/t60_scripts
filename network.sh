#!/bin/sh
IP=`ifconfig wlan0 | grep -Eo 'inet (addr")?([0-9]*\.){3}[0-9]*' | cut -d ' ' -f2`
if [[ $IP == "" ]]
then
    echo 'NONE'
else
    echo $IP
fi
