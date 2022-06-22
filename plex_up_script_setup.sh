#!/bin/bash

# This script is for setting up the required directories for using the up_script.sh

checkpathplex=~/Movies/Plex/
checkpathdownloaded=~/Movies/Plex/Downloaded/
checkpathlists=~/Movies/Plex/Lists/
checkpathmovies=~/Movies/Plex/Movies/
checkpathmusic=~/Movies/Plex/Music/
checkpathtv_shows=~/Movies/Plex/Tv_Shows/
checkpathuploaded=~/Movies/Plex/Uploaded/
checkpathworkout=~/Movies/Plex/Workout/




setup_plex_dirs (){


    if [ -d "$checkpathplex" ] 
    then
        echo "Directory $checkpathplex exists." 
    else
        echo "Error: Directory $checkpathplex does not exist."
        mkdir -p $checkpathplex
        echo " - $checkpathplex has been created"
    fi


    if [ -d "$checkpathdownloaded" ] 
    then
        echo "Directory $checkpathdownloaded exists." 
    else
        echo "Error: Directory $checkpathdownloaded does not exist."
        mkdir -p $checkpathdownloaded
        echo " - $checkpathdownloaded has been created"
    fi


    if [ -d "$checkpathlists" ] 
    then
        echo "Directory $checkpathlists exists." 
    else
        echo "Error: Directory $checkpathlists does not exist."
        mkdir -p $checkpathlists
        echo " - $checkpathlists has been created"
    fi


    if [ -d "$checkpathmovies" ] 
    then
        echo "Directory $checkpathmovies exists." 
    else
        echo "Error: Directory $checkpathmovies does not exist."
        mkdir -p $checkpathmovies
        echo " - $checkpathmovies has been created"
    fi


    if [ -d "$checkpathmusic" ] 
    then
        echo "Directory $checkpathmusic exists." 
    else
        echo "Error: Directory $checkpathmusic does not exist."
        mkdir -p $checkpathmusic
        echo " - $checkpathmusic has been created"
    fi


    if [ -d "$checkpathtv_shows" ] 
    then
        echo "Directory $checkpathtv_shows exists." 
    else
        echo "Error: Directory $checkpathtv_shows does not exist."
        mkdir -p $checkpathtv_shows
        echo " - $checkpathtv_shows has been created"
    fi


    if [ -d "$checkpathuploaded" ] 
    then
        echo "Directory $checkpathuploaded exists." 
    else
        echo "Error: Directory $checkpathuploaded does not exist."
        mkdir -p $checkpathuploaded
        echo " - $checkpathuploaded has been created"
    fi


    if [ -d "$checkpathworkout" ] 
    then
        echo "Directory $checkpathworkout exists." 
    else
        echo "Error: Directory $checkpathworkout does not exist."
        mkdir -p $checkpathworkout
        echo " - $checkpathworkout has been created"
    fi


}


setup_plex_dirs
