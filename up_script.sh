#!/bin/bash

# Things to add to the script #Personal Use
# Add a function that auto picks which disk to use based on disk that has the most free space
# Add a function that searches when uploading tv shows to find current tv_show folder
#
#
# This script is for uploading files to a Plex Media Server | Also includes a Disk Space Checker and Random Movie Picker for Movies uploaded
# 		Compatibility is with Linux and Unix ONLY
# 		Edit all paths to equal what paths are being used in the config.yml
# 
# 
# 
# 
# to use this script you have to have these dirs in your current users path - Unix / Linux ONLY
# 
# 		You can create these dirs by running the plex_up_script_setup.sh script
# /Users/$USER/Movies/Plex/Movies
# /Users/$USER/Movies/Plex/Tv_Shows
# /Users/$USER/Movies/Plex/Music
# /Users/$USER/Movies/Plex/Workout
#




#########################################################################################
########	        config.yml file to make customizing variables easier		#########

# include parse_yaml function
. parse_yaml.sh

# read yaml file / point parse_yaml at config.yml file and you are good go
eval $(parse_yaml /Users/$USER/Workspace/Plex/config.yml "config_")

# access yaml content
# path variables from config.yml
exitcode=$config_paths_exitcode
ipaddress=$config_paths_ipaddress
logpath=$config_paths_logpath
grepsearchpattern=$config_paths_grepsearchpattern
uploaduser=$config_paths_uploaduser
disk1=$config_paths_disk1
disk2=$config_paths_disk2
disk3=$config_paths_disk3
disk4=$config_paths_disk4
disk5=$config_paths_disk5
plexrootfolder=$config_paths_plexrootfolder
cpath=$config_paths_cpath
movielistpath=$config_paths_movielistpath
uppath=$config_paths_uppath
logfile=$config_paths_logfile

# bashfiles variables
plexrootscripts=$config_bashfiles_plexrootscripts
upscriptpath="${plexrootscripts}${config_bashfiles_upscriptpath}"
randmovie="${plexrootscripts}${config_bashfiles_randmovie}"
mvfile="${plexrootscripts}${config_bashfiles_mvfile}"
serverstatus="${plexrootscripts}${config_bashfiles_serverstatus}"
diskspace="${plexrootscripts}${config_bashfiles_diskspace}"
createlog="${plexrootscripts}${config_bashfiles_createlog}"
confirmupload="${plexrootscripts}${config_bashfiles_confirmupload}"
movieuploader="${plexrootscripts}${config_bashfiles_movieuploader}"
pickdisk="${plexrootscripts}${config_bashfiles_pickdisk}"
findcurrenttvshows="${plexrootscripts}${config_bashfiles_findcurrenttvshows}"
#########################################################################################

list=$(ssh "$uploaduser"@"$ipaddress" "df -lh | tail -8 | awk '{print $4 " " $9}' | grep "$grepsearchpattern"")
set -- $list

while [ "$exitcode" != "q" ]
	do
		echo -e "\n\n________________________________________________________________________"
		echo -e "Running: "$upscriptpath"\n\n"
		cpath=$config_paths_cpath

		echo -e "\n 	################################################################\n 	1(Movie Uploader) , 2(Random Movie Picker) , 3(Check Disk Space)\n	################################################################\n"

		echo -e "Enter 'q' to quit"
		read -p "What program do you want to use? " programType
		exitcode=$programType


		#Function that will move all downloaded files to the correct uptype choice
		mv_download_files (){
			if test "$uptype" == "1"; then
				mv * $cpath
			fi

			if test "$uptype" == "2"; then
				mv * $cpath
			fi

			if test "$uptype" == "3"; then
				mv * $cpath
			fi

			if test "$uptype" == "4"; then
				mv * $cpath
			fi

		}


		#Function that sets and prints current paths for option selected
		current_paths () {
			cd $cpath
			echo -e "\n############################################################\nCurrent Path: " $PWD 
			echo -e "Upload Path: " $ppath
			echo -e "\n\nCurrent Files:\n\n" "$(ls *) \n############################################################\n"
		}

		
		# Main Function continued with programType choice
		if test "$programType" == 1; then

			source $movieuploader

		elif test "$programType" == 2; then

			#echo $randmovie
			source $randmovie


		# Check Disk Space Option
		elif test "$programType" == 3; then

			source $diskspace

		elif test "$programType" == 4; then
			
			#echo -e "This option has been disabled"
			source $pickdisk

		elif test "$programType" == "q"; then
			echo -e "\n***** Thanks for stopping by! See ya! *****\n"

		else
			echo -e "\n***** This is not an option! *****\n"
		fi

	

	done

