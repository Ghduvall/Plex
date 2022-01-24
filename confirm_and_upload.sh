#!/bin/bash

#Function that confirms upload and start upload of files

if test "$confirm" == "y"; then
    source $createlog
    if scp -r -o ConnectTimeout=100 * "$uploaduser"@"$ipaddress":$ppath; then
        #echos current files being uploaded into movies.txt for random movie picker
        echo "$(ls *)"  >> $movielistpath
        source $mvfile
        echo "Done!"

    else
        echo "SCP TRANSFER FAILED"
    fi
    
fi	
