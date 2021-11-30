#!/bin/bash


#Function that reads each line of the file then stores the number count of lines in $n
read_file_line () {
    movielistpath=$movielistpath
    #echo $movielistpath
    n=1
    while read line; do
    # reading each line
    n=$((n+1))
    done < $movielistpath 
}


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
    sed "${NUM}q;d" $movielistpath
    echo -e "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\n\n"

}

random_movie_picker