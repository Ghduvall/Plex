#!/bin/bash

# This script is for setting up the required directories on the server side external drive for using the up_script.sh
#   Just change vars below to what path you want


drivename=MacPlexExternal5

checkpathplex=/Volumes/$drivename/PlexMedia
checkpathlogs=/Volumes/$drivename/PlexMedia/logs
checkpathmovies=/Volumes/$drivename/PlexMedia/movies
checkpathmusic=/Volumes/$drivename/PlexMedia/music
checkpathtv_shows=/Volumes/$drivename/PlexMedia/tv_shows
checkpathother_videos=/Volumes/$drivename/PlexMedia/other_videos
checkpathunsorted=/Volumes/$drivename/PlexMedia/other_videos/unsorted
checkpathworkout=/Volumes/$drivename/PlexMedia/other_videos/workout




setup_plexserver_dirs (){


    if [ -d "$checkpathplex" ] 
    then
        echo "Directory $checkpathplex exists." 
    else
        echo "Error: Directory $checkpathplex does not exist."
        mkdir $checkpathplex
        echo " - $checkpathplex has been created"
    fi


    if [ -d "$checkpathlogs" ] 
    then
        echo "Directory $checkpathlogs exists." 
    else
        echo "Error: Directory $checkpathlogs does not exist."
        mkdir $checkpathlogs
        echo " - $checkpathlogs has been created"
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


    if [ -d "$checkpathother_videos" ] 
    then
        echo "Directory $checkpathother_videos exists." 
    else
        echo "Error: Directory $checkpathother_videos does not exist."
        mkdir $checkpathother_videos
        echo " - $checkpathother_videos has been created"
    fi



    if [ -d "$checkpathunsorted" ] 
    then
        echo "Directory $checkpathunsorted exists." 
    else
        echo "Error: Directory $checkpathunsorted does not exist."
        mkdir $checkpathunsorted
        echo " - $checkpathunsorted has been created"
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


setup_plexserver_dirs