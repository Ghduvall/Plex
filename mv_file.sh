#!/bin/bash

# This script is for moving files after movie has successfully uploaded

uppath=$uppath

move_file (){
    echo -e "\n"
    echo -e "==========================================================\n $(ls *) \n\n-Files moved to $uppath \n==========================================================\n"
    mv * $uppath
}


move_file