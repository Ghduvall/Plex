#!/bin/bash

upshows=$(ls)
#echo $upshows

echo -e "\n\n HELLO THIS IS \n FINDING ALREADY\n UPLOADED TVSHOWS\n\n"

tvlist1=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk1}/tv_shows/" | grep $upshows")
tvstr1=$(echo "$tvlist1" | awk '{print $9,$10,$11,$12,$13}')
#set -- $tvstr1

# In case the string between * * needs to be set to the same var as grep to search for tvshow being uploaded
# Using case because if does not allow searcing for substring 
case "$tvstr1" in
    *$upshows* ) echo "Found the show on ${disk1}";;
    * ) echo "Did not find the show on ${disk1}";;
esac

tvlist2=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk2}/tv_shows/" | grep $upshows")
tvstr2=$(echo "$tvlist2" | awk '{print $9,$10,$11,$12,$13}')
# Using case because if does not allow searcing for substring 
case "$tvstr2" in
    *$upshows*) echo "Found the show on ${disk2}";;
    * ) echo "Did not find the show on ${disk2}";;
esac

tvlist3=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk3}/tv_shows/" | grep $upshows")
tvstr3=$(echo "$tvlist3" | awk '{print $9,$10,$11,$12,$13}')
# Using case because if does not allow searcing for substring 
case "$tvstr3" in
    *$upshows*) echo "Found the show on ${disk3}";;
    * ) echo "Did not find the show on ${disk3}";;
esac

tvlist4=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk4}/tv_shows/" | grep $upshows")
tvstr4=$(echo "$tvlist4" | awk '{print $9,$10,$11,$12,$13}')
# Using case because if does not allow searcing for substring 
case "$tvstr4" in
    *$upshows*) echo "Found the show on ${disk4}";;
    * ) echo "Did not find the show on ${disk4}";;
esac

tvlist5=$(ssh "$uploaduser"@"$ipaddress" "ls -l "${disk5}/tv_shows/" | grep $upshows")
tvstr5=$(echo "$tvlist5" | awk '{print $9,$10,$11,$12,$13}')
# Using case because if does not allow searcing for substring 
case "$tvstr5" in
    *$upshows*) echo "Found the show on ${disk5}";;
    * ) echo "Did not find the show on ${disk5}";;
esac


#ssh "$uploaduser"@"$ipaddress" ls -l "${disk1}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk2}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk3}/tv_shows/"
#ssh "$uploaduser"@"$ipaddress" ls -l "${disk4}/tv_shows/"