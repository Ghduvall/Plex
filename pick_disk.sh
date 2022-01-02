#!/bin/bash

# Choosing disk that has the most free space and uploading to it

mp1name=$(cut -c 10-25 <<<"$disk1")
mp1=$(ssh "$uploaduser"@"$ipaddress" "df -lh | grep $mp1name")
mp1free=$(cut -c 29-33 <<<"$mp1")

mp2name=$(cut -c 10-25 <<<"$disk2")
mp2=$(ssh "$uploaduser"@"$ipaddress" "df -lh | grep $mp2name")
mp2free=$(cut -c 29-33 <<<"$mp2")

mp3name=$(cut -c 10-25 <<<"$disk3")
mp3=$(ssh "$uploaduser"@"$ipaddress" "df -lh | grep $mp3name")
mp3free=$(cut -c 29-33 <<<"$mp3")

mp4name=$(cut -c 10-25 <<<"$disk4")
mp4=$(ssh "$uploaduser"@"$ipaddress" "df -lh | grep $mp4name")
mp4free=$(cut -c 29-33 <<<"$mp4")

mp5name=$(cut -c 10-25 <<<"$disk5")
mp5=$(ssh "$uploaduser"@"$ipaddress" "df -lh | grep $mp5name")
mp5free=$(cut -c 29-33 <<<"$mp5")


if (($mp1free >= $mp2free)) && (($mp1free >= $mp3free)) && (($mp1free >= $mp4free)) && (($mp1free >= $mp5free)) ; then
    #echo -e "\n"$mp1free
    #echo -e "\nI choose "$mp1name
    ppath="${disk1}"
    #echo "I choose ${mp1name}"
elif (($mp2free >= $mp1free)) && (($mp2free >= $mp3free)) && (($mp2free >= $mp4free)) && (($mp2free >= $mp5free)) ; then
    #echo -e "\n"$mp2free
    #echo -e "\nI choose "$mp2name
    ppath="${disk2}"
    #echo "I choose ${mp2fname}"
elif (($mp3free >= $mp1free)) && (($mp3free >= $mp2free)) && (($mp3free >= $mp4free)) && (($mp3free >= $mp5free)) ; then
    #echo -e "\n"$mp3free
    #echo -e "\nI choose "$mp3name
    ppath="${disk3}"
    #echo "I choose ${mp3name}"
elif (($mp4free >= $mp1free)) && (($mp4free >= $mp2free)) && (($mp4free >= $mp3free)) && (($mp4free >= $mp5free)) ; then
    #echo -e "\n"$mp3free
    #echo -e "\nI choose "$mp4name
    ppath="${disk4}"
    #echo "${ppath} Is this"
    #echo "${disk4} is disk4"
    #echo "I choose ${mp4name}"
elif (($mp5free >= $mp1free)) && (($mp5free >= $mp2free)) && (($mp5free >= $mp3free)) && (($mp5free >= $mp4free)) ; then
    #echo -e "\n"$mp3free
    # echo -e "\nI choose "$mp5name
    ppath="${disk5}"
    # echo "${ppath} Is this"
    # echo "${disk5} is disk5"
    #echo "I choose ${mp5name}"
fi

