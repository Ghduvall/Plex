#!/bin/bash

# This is the main option one program that uploads files


echo -e "\n 	--------------------------------------\n 	You chose, To use the Movie Uploader.\n 	--------------------------------------\n"

#echo "Current Path: " $PWD

#Calling serverstatus script to check server
source $serverstatus
#echo $serverResponse"THIS IS ME"
if test "$serverResponse" == "1"; then
    echo -e "Continuing with the script.\n"

        cd $cpath"Downloaded"
        echo -e "________________________________________________________________________\nCurrent Files in $(PWD):\n\n" "$(ls *) \n________________________________________________________________________\n"
        read -p "Choose upload type - 1(Movies) 2(Tv Shows) 3(Music) 4(Workout): " uptype
        
        # Choosing disk that has the most free space and uploading to it
        source $pickdisk

        #echo "You chose, $uptype."


        if test "$uptype" == 1; then
            ppath=$ppath"/movies"
            cpath=$cpath"Movies"
            export cpath

            mv_download_files
            current_paths
            clear

            read -p "Are you sure you want to upload Movies: " confirm
            source $confirmupload

            

        elif test "$uptype" == 2; then
            ppath=$ppath"/tv_shows"
            cpath=$cpath"Tv_Shows"
            export cpath

            mv_download_files
            current_paths
            clear
            echo $'\e[1;33m'_____________________________________________________________________________________________________$'\e[0m'
            echo -e "When Uploading Tv Shows please create a parent folder with the shows name in this format"
            echo -e "Game of Thrones --> Game.Of.Thrones"
            echo -e "Once that folder is created put that folder in Plex/Downloaded/ directory"
            echo -e "Then put all tv shows files for that show in the new folder"
            echo $'\e[1;33m'_____________________________________________________________________________________________________$'\e[0m'
            echo -e "\n"
            read -p "Are you sure you want to upload Tv Shows?: " confirm
            source $findcurrenttvshows
            source $confirmupload

        elif test "$uptype" == 3; then
            ppath=$ppath"/music"
            cpath=$cpath"Music"
            export cpath

            mv_download_files
            current_paths
            clear
            
            read -p "Are you sure you want to upload Music?: " confirm
            source $confirmupload

        elif test "$uptype" == 4; then
            ppath=$ppath"/other_videos/workout"
            cpath=$cpath"Workout"
            export cpath

            mv_download_files
            current_paths
            clear

            read -p "Are you sure you want to upload Workouts?: " confirm
            source $confirmupload

        else test;
            echo -e "\n***** ""$uptype"" - is not an option *****\n"
            break
        fi

    elif test "$serverResponse" == "0";then
        echo -e "Please Check your server status.\n"
    else 
        echo -e "I don't see a response at all"
fi	

