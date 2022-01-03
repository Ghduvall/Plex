#!/bin/bash

# Things to add to the script
# 1.Going to make script list movies in download dir and ask where to upload them to
#  a.Once asking upload to path choose from Movies, Music, Tv_Shows, Workout


# This script is for uploading files to a Plex Media Server | Also includes a Disk Space Checker and Random Movie Picker from Movies uploaded
# Compatibility is with Linux and Unix ONLY
# Edit all paths to equal what paths are being used
# 
# 
# 
# 
# to use this script you have to have these dirs in your current users path - Unix / Linux ONLY
# /Users/$USER/Movies/Plex/Movies
# /Users/$USER/Movies/Plex/Tv_Shows
# /Users/$USER/Movies/Plex/Music
# /Users/$USER/Movies/Plex/Workout
#
# Edit ppath var to what paths are being used on Plex Media Server
#


#exitcode=""
#ipaddress="192.168.1.108"
#logpath=/home/plex/logs
#greppath='cl-home\|disk1'
#uploaduser=root


#########################################################################################
########	Adding a config.yml file to make customizing variables easier		#########

# include parse_yaml function
. parse_yaml.sh

# read yaml file
eval $(parse_yaml config.yml "config_")

# access yaml content

# path variables
exitcode=$config_paths_exitcode
ipaddress=$config_paths_ipaddress
logpath=$config_paths_logpath
greppath=$config_paths_greppath
uploaduser=$config_paths_uploaduser
disk1=$config_paths_disk1
disk2=$config_paths_disk2
disk3=$config_paths_disk3
plexrootfolder=$config_paths_plexrootfolder
cpath=$config_paths_cpath

# 

#########################################################################################


while [ "$exitcode" != "q" ]
	do
		echo -e "\n 	################################################################\n 	1(Movie Uploader) , 2(Random Movie Picker) , 3(Check Disk Space)\n	################################################################\n"

		echo -e "Enter 'q' to quit"
		read -p "What program do you want to use? " programType
		exitcode=$programType




		# Function that calls mv_file.sh to move files after being uploaded
		run_mv_file () {
			/Users/$USER/mv_file.sh
		}

		#Function that reads each line of the file then stores the number count of lines in $n
		read_file_line () {
			filename=/Users/$USER/Movies/Plex/Lists/movies.txt
			n=1
			while read line; do
			# reading each line
			n=$((n+1))
			done < $filename 
		}

		#Function that creates logfile
		create_log_file () {
			logfile=/Users/$USER/Movies/Plex/Lists/upload"$(hostname)".txt

			echo -e "\n_________________________________________________________________________________________" >> $logfile
			echo -e "Computer Name: " "$(hostname)" "(" "$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')" ")">> $logfile
			echo -e "Upload Path: " $ppath >> $logfile
			echo -e "Current Path: " $PWD >> $logfile
			echo -e "Files:\n" "$(ls *)" >> $logfile
			echo -e "Time Uploaded: " "$(date)" >> $logfile

			scp -o ConnectTimeout=100 "$logfile" "$uploaduser"@"$ipaddress":"$logpath"
		}

		#Function that picks random Movie from movies.txt
		random_movie_picker () {
			echo -e "\n 	##########################################\n 	You chose to pick a random movie!\n 	##########################################\n"

			read_file_line

			#read -p "How many movies do you have? " mnumber

			submnumber=$((n + 1))
			
			echo -e "\n 	##########################################\n 	Ready"
			sleep .2
			echo " 	."
			sleep .2
			echo " 	."
			sleep .2
			echo " 	."
			sleep .35
			echo " 	Set"
			sleep .2
			echo " 	."
			sleep .2
			echo " 	."
			sleep .2
			echo " 	."
			sleep .35
			echo " 	Go!"
			sleep .2

			NUM=$((RANDOM % submnumber))
			echo -e "\n 	Number rolled is --> " $NUM "\n 	##########################################\n"

			#echo line that is selected from RANDOM
			echo -e "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\n Your movie is - "
			sed "${NUM}q;d" $filename
			echo -e "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\n\n"

		}


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

		#Function that confirms upload and start upload of files
		confirm_and_upload () {
			if test "$confirm" == 'y'; then

				create_log_file

			    scp -r -o ConnectTimeout=100 * "$uploaduser"@"$ipaddress":$ppath

				run_mv_file

			    echo "Done!"
			fi	
		}

		# Function for moving a new edited file
		copy_whole_file () {

			cd /Users/$USER
			cp up_script.sh /Users/$USER/Coding/bash/plex/up_script.sh
			cp mv_file.sh /Users/$USER/Coding/bash/plex/mv_file.sh

			echo -e "\n============== Files Copied ==============\n"

		}
		

		# Main Function continued with programType choice

		if test "$programType" == 1; then

			echo -e "\n 	##########################################\n 	You chose, To use the Movie Uploader.\n 	##########################################\n"

			#echo "Current Path: " $PWD


			cd $cpath"Downloaded"
			echo -e "############################################################\nCurrent Files in $(PWD):\n\n" "$(ls *) \n############################################################\n"
			read -p "Choose upload type - 1(Movies) 2(Tv Shows) 3(Music) 4(Workout): " uptype
			

			#read -p "What are you uploading? 1(Movies) 2(Tv Shows) 3(Music) 4(Workout): " uptype
			read -p "What path? 1 ("$disk1") 2 ("$disk2") 3 ("$disk3"): " dpath

			if test "$dpath" == 1; then
				ppath="${disk1}${plexrootfolder}"
			elif test "$dpath" == 2; then
				ppath="${disk2}${plexrootfolder}"
			elif test "$dpath" == 3; then
				ppath="${disk3}${plexrootfolder}"
			elif test "$dpath" == 4; then
				ppath="${disk4}${plexrootfolder}"	
			elif test "$dpath" == 5; then
				ppath="${disk5}${plexrootfolder}"
			else

				echo -e "\n***** ""$dpath"" - is not an option *****\n"
				break

			fi

			#echo "You chose, $uptype."


			if test "$uptype" == 1; then

				ppath=$ppath"/movies"
				cpath=$cpath"Movies"
				export cpath

				mv_download_files
				current_paths

				read -p "Are you sure you want to upload Movies: " confirm
				
				confirm_and_upload


				#echos current files being uploaded into movies.txt for random movie picker
				if test "$confirm" == "y"; then
					echo "$(ls)"  >> /Users/$USER/Movies/Plex/Lists/movies.txt
				fi

			elif test "$uptype" == 2; then

				ppath=$ppath"/tv_shows"
				cpath=$cpath"Tv_Shows"
				export cpath

				mv_download_files
				current_paths

				read -p "Are you sure you want to upload Tv Shows?: " confirm

				confirm_and_upload

			elif test "$uptype" == 3; then

				ppath=$ppath"/music"
				cpath=$cpath"Music"
				export cpath

				mv_download_files
				current_paths

				read -p "Are you sure you want to upload Music?: " confirm

				confirm_and_upload

			elif test "$uptype" == 4; then

				ppath=$ppath"/other_videos/workout"
				cpath=$cpath"Workout"
				export cpath

				mv_download_files
				current_paths

				read -p "Are you sure you want to upload Workouts?: " confirm

				confirm_and_upload

			else test;
				echo -e "\n***** ""$uptype"" - is not an option *****\n"
				break
			fi



		elif test "$programType" == 2; then

			random_movie_picker


		# Check Disk Space Option
		elif test "$programType" == 3; then

			#grep 'pattern1\|pattern2' is how you combine two diffrent searches in one grep
			echo -e "DISK                    USED  FREE"
			ssh "$uploaduser"@"$ipaddress" df -lh | grep "$greppath"

		elif test "$programType" == 4; then

			copy_whole_file

		elif test "$programType" == "q"; then
			echo -e "\n***** Thanks for stopping by! See ya! *****\n"

		else
			echo -e "\n***** This is not an option! *****\n"
		fi


	done

