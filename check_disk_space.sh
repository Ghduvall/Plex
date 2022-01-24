#!/bin/bash

#grep 'pattern1\|pattern2' is how you combine two diffrent searches in one grep
echo -e "\n________________________________________________________________________________________________"
echo -e "DISK                    USED  FREE"
ssh "$uploaduser"@"$ipaddress" df -lh | grep "$grepsearchpattern"
echo -e "________________________________________________________________________________________________"

