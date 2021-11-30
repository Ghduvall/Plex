#!/bin/bash


logfile=$logfile"$(hostname)".txt

echo -e "\n_________________________________________________________________________________________" >> $logfile
echo -e "Computer Name: " "$(hostname)" "(" "$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')" ")">> $logfile
echo -e "Upload Path: " $ppath >> $logfile
echo -e "Current Path: " $PWD >> $logfile
echo -e "Files:\n" "$(ls *)" >> $logfile
echo -e "Time Uploaded: " "$(date)" >> $logfile

scp -o ConnectTimeout=100 "$logfile" "$uploaduser"@"$ipaddress":"$logpath"