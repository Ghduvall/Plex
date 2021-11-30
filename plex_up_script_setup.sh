#!/bin/bash

# This script is for setting up the required directories for using the up_script.sh

checkpathplex=/Users/$USER/Movies/Plex
checkpathdownloaded=/Users/$USER/Movies/Plex/Downloaded
checkpathlists=/Users/$USER/Movies/Plex/Lists
checkpathmovies=/Users/$USER/Movies/Plex/Movies
checkpathmusic=/Users/$USER/Movies/Plex/Music
checkpathtv_shows=/Users/$USER/Movies/Plex/Tv_Shows
checkpathuploaded=/Users/$USER/Movies/Plex/Uploaded
checkpathworkout=/Users/$USER/Movies/Plex/Workout




setup_plex_dirs (){


    if [ -d "$checkpathplex" ] 
    then
        echo "Directory $checkpathplex exists." 
    else
        echo "Error: Directory $checkpathplex does not exist."
        mkdir $checkpathplex
        echo " - $checkpathplex has been created"
    fi


    if [ -d "$checkpathdownloaded" ] 
    then
        echo "Directory $checkpathdownloaded exists." 
    else
        echo "Error: Directory $checkpathdownloaded does not exist."
        mkdir $checkpathdownloaded
        echo " - $checkpathdownloaded has been created"
    fi


    if [ -d "$checkpathlists" ] 
    then
        echo "Directory $checkpathlists exists." 
    else
        echo "Error: Directory $checkpathlists does not exist."
        mkdir $checkpathlists
        echo " - $checkpathlists has been created"
    fi


    if [ -d "$checkpathmovies" ] 
    then
        echo "Directory $checkpathmovies exists." 
    else
        echo "Error: Directory $checkpathmovies does not exist."
        mkdir $checkpathmovies
        echo " - $checkpathmovies has been created"
    fi


    if [ -d "$checkpathmusic" ] 
    then
        echo "Directory $checkpathmusic exists." 
    else
        echo "Error: Directory $checkpathmusic does not exist."
        mkdir $checkpathmusic
        echo " - $checkpathmusic has been created"
    fi


    if [ -d "$checkpathtv_shows" ] 
    then
        echo "Directory $checkpathtv_shows exists." 
    else
        echo "Error: Directory $checkpathtv_shows does not exist."
        mkdir $checkpathtv_shows
        echo " - $checkpathtv_shows has been created"
    fi


    if [ -d "$checkpathuploaded" ] 
    then
        echo "Directory $checkpathuploaded exists." 
    else
        echo "Error: Directory $checkpathuploaded does not exist."
        mkdir $checkpathuploaded
        echo " - $checkpathuploaded has been created"
    fi


    if [ -d "$checkpathworkout" ] 
    then
        echo "Directory $checkpathworkout exists." 
    else
        echo "Error: Directory $checkpathworkout does not exist."
        mkdir $checkpathworkout
        echo " - $checkpathworkout has been created"
    fi


}


setup_plex_dirs