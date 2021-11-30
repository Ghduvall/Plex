#!/bin/bash

# Choosing disk that has the most free space and uploading to it

# This below has made the push to grab a df from server and then convert that result
#   into a string variable

mp1free=" "
mp2free=" "
mp3free=" "
mp4free=" "
mp5free=" "
mp1name=" "
mp2name=" "
mp3name=" "
mp4name=" "
mp5name=" "

mp1name=$(echo ${27})
# The awk is being used to get ride of the Gi after the number so it can be used as an int
mp1free=$(echo ${22} | awk '{ print substr( $0, 1, length($0)-2 ) }') 
#echo $mp1free $mp1name

mp2name=$(echo ${18})
mp2free=$(echo ${13} | awk '{ print substr( $0, 1, length($0)-2 ) }')
#echo $mp2free $mp2name

mp3name=$(echo ${9})
mp3free=$(echo ${4} | awk '{ print substr( $0, 1, length($0)-2 ) }')
#echo $mp3free $mp3name

mp4name=$(echo ${45})
mp4free=$(echo ${40} | awk '{ print substr( $0, 1, length($0)-2 ) }')
#echo $mp4free $mp4name

mp5name=$(echo ${36})
mp5free=$(echo ${31} | awk '{ print substr( $0, 1, length($0)-2 ) }')
#echo $mp5free $mp5name


if (($mp1free >= $mp2free)) && (($mp1free >= $mp3free)) && (($mp1free >= $mp4free)) && (($mp1free >= $mp5free)) ; then
    #echo -e "\n"$mp1free
    #echo -e "\nI choose "$mp1name
    ppath="${disk1}"
    echo "I choose ${mp1free}"
elif (($mp2free >= $mp1free)) && (($mp2free >= $mp3free)) && (($mp2free >= $mp4free)) && (($mp2free >= $mp5free)) ; then
    #echo -e "\n"$mp2free
    #echo -e "\nI choose "$mp2name
    ppath="${disk2}"
    echo "I choose ${mp2free}"
elif (($mp3free >= $mp1free)) && (($mp3free >= $mp2free)) && (($mp3free >= $mp4free)) && (($mp3free >= $mp5free)) ; then
    #echo -e "\n"$mp3free
    #echo -e "\nI choose "$mp3name
    ppath="${disk3}"
    echo "I choose ${mp3free}"
elif (($mp4free >= $mp1free)) && (($mp4free >= $mp2free)) && (($mp4free >= $mp3free)) && (($mp4free >= $mp5free)) ; then
    #echo -e "\n"$mp3free
    echo -e "\nI choose "$mp4name
    ppath="${disk4}"
    echo "${ppath} Is this"
    echo "${disk4} is disk4"
    echo "I choose ${mp4free}"
elif (($mp5free >= $mp1free)) && (($mp5free >= $mp2free)) && (($mp5free >= $mp3free)) && (($mp5free >= $mp4free)) ; then
    #echo -e "\n"$mp3free
    echo -e "\nI choose "$mp5name
    ppath="${disk5}"
    echo "${ppath} Is this"
    echo "${disk5} is disk5"
    echo "I choose ${mp5free}"
fi

