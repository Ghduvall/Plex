#!/bin/bash
# Add a txt file that shows path using upload path and files being uploaded



exitcode=""

while [ "$exitcode" != "q" ]
	do
		echo -e "\n 	################################################################\n 	1(Movie Uploader) , 2(Random Movie Picker) , 3(Check Disk Space)\n	################################################################\n"

		echo -e "Enter 'q' to quit"
		read -p "What program do you want to use? " programType
		exitcode=$programType

		# function that reads each line of the file then stores the number count of lines in $n
		read_file_line () {
			filename='/Users/grantduvall/Movies/Plex/Lists/movies.txt'
			n=1
			while read line; do
			# reading each line
			n=$((n+1))
			done < $filename 
		}

		create_log_file () {
			logfile=/Users/grantduvall/Movies/Plex/Lists/upload"$(hostname)".txt

			echo -e "\n_________________________________________________________________________________________" >> $logfile
			echo -e "Computer Name: " "$(hostname)" "(" "$(ifconfig | grep 192.168.1)" ")">> $logfile
			echo -e "Upload Path: " $ppath >> $logfile
			echo -e "Current Path: " $PWD >> $logfile
			echo -e "Files:\n" "$(ls)" >> $logfile
			echo -e "Time Uploaded: " "$(date)" >> $logfile

			scp "$logfile" root@192.168.1.114:/media/plex/logs
		}
		

		if test "$programType" == 1; then

			echo -e "\n 	##########################################\n 	You chose, To use the Movie Uploader.\n 	##########################################\n"

			#echo "Current Path: " $PWD
			read -p "What are you uploading? 1(Movies) 2(Tv Shows) 3(Music) 4(Workout): " uptype
			read -p "What path? 1(/media/plex/) 2(/disk1/plex - external): " dpath

			if test "$dpath" == 1; then

				ppath="/media/plex"

			elif test "$dpath" == 2; then

				ppath="/disk1/plex"

			fi

			#echo "You chose, $uptype."


			if test "$uptype" == 1; then

				ppath=$ppath"/movies"

				
				cd /Users/grantduvall/Movies/Plex/Movies
				echo -e "\n############################################################\nCurrent Path: " $PWD 
				echo -e "Upload Path: " $ppath
				echo -e "\n\nCurrent Files:\n\n" "$(ls) \n############################################################\n"

				read -p "Are you sure you want to upload Movies: " confirm
				
				if test "$confirm" == "y"; then

					echo "$(ls)"  >> /Users/grantduvall/Movies/Plex/Lists/movies.txt

					create_log_file

					scp -r -o ConnectTimeout=100 * root@192.168.1.114:$ppath
					echo "Success!"
				fi 

			elif test "$uptype" == 2; then

				ppath=$ppath"/tv_shows"

				cd /Users/grantduvall/Movies/Plex/Tv\ Shows/
				echo -e "\n############################################################\nCurrent Path: " $PWD 
				echo -e "Upload Path: " $ppath
				echo -e "\n\nCurrent Files:\n\n" "$(ls) \n############################################################\n"

				read -p "Are you sure you want to upload Tv Shows?: " confirm

				if test "$confirm" == 'y'; then

					create_log_file

			        scp -r -o ConnectTimeout=100 * root@192.168.1.114:$ppath
			        echo "Success!"
			    fi	

			elif test "$uptype" == 3; then

				ppath=$ppath"/music"

				cd /Users/grantduvall/Movies/Plex/Music
			    echo -e "\n############################################################\nCurrent Path: " $PWD 
			    echo -e "Upload Path: " $ppath
				echo -e "\n\nCurrent Files:\n\n" "$(ls) \n############################################################\n"

				read -p "Are you sure you want to upload Music?: " confirm

				if test "$confirm" == 'y'; then

					create_log_file

			        scp -r -o ConnectTimeout=100 * root@192.168.1.114:$ppath
			        echo "Success!"
			    fi	

			elif test "$uptype" == 4; then

				ppath=$ppath"/other_videos/workout"

				cd /Users/grantduvall/Movies/Plex/Workout
				echo -e "\n############################################################\nCurrent Path: " $PWD 
				echo -e "Upload Path: " $ppath
				echo -e "\n\nCurrent Files:\n\n" "$(ls) \n############################################################\n"

				read -p "Are you sure you want to upload Workouts?: " confirm

				if test "$confirm" == 'y'; then

					create_log_file

			        scp -r -o ConnectTimeout=100 * root@192.168.1.114:$ppath
			        echo "Success!"
			    fi	

			else test;
				echo "This is not an option"
			fi



		elif test "$programType" == 2; then
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

		elif test "$programType" == 3; then

			#grep 'pattern1\|pattern2' is how you combine two diffrent searches in one grep
			echo -e "DISK                       USED  FREE"
			ssh root@192.168.1.114 df -lh | grep 'cl-root\|disk1'

		else
			echo -e "\n***** Thanks for stopping by! See ya! *****\n"
		fi


	done

