#!/bin/bash

# This script is for moving files after movie has successfully uploaded

uppath=$uppath

# uppath: /Users/$USER/Movies/Plex/Uploaded

check_already_uploaded (){
    pwd
    ls -la
}


move_file (){
    echo -e "\n"
    echo -e "==========================================================\n $(ls *) \n\n-Files moved to $uppath \n==========================================================\n"
    mv * $uppath
}

#check_already_uploaded
move_file