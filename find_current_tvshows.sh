#!/bin/bash




# GREP needs to be changed to a variable that scans current Plex/TV_Shows of uploading computer
tvlist1=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk1}/tv_shows/" | grep "70"")
tvstr1=$(echo "$tvlist1" | awk '{print $9,$10,$11,$12}')
echo $tvstr1
#set -- $tvstr1

# In case the string between * * needs to be set to the same var as grep to search for tvshow being uploaded
# Using case because if does not allow searcing for substring 
case "$tvstr1" in
    *7* ) echo "Found the show on ${disk1}";;
    *Show* ) echo "do something # 2";;
    * ) echo "Did not find the show on ${disk1}";;
esac



tvlist2=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk2}/tv_shows/"")
tvstr2=$(echo "$tvlist2" | awk '{print $9,$10,$11,$12}')
echo $tvstr2

# Using case because if does not allow searcing for substring 
case "$tvstr2" in
    *Rick* ) echo "Found the show on ${disk2}";;
    *Show* ) echo "do something # 2";;
    * ) echo "Did not find the show on ${disk2}";;
esac



echo -e "\n\n HELLO THIS IS \nFINDING ALREADY\n UPLOADED TVSHOWS\n\n"

#ssh "$uploaduser"@"$ipaddress" ls -l "${disk1}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk2}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk3}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk4}/tv_shows/"


