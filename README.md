# Plex
 # Tool that helps upload and store plex media

 ## Things to change for program to work.
 ---

 ### config.yml
 
    plexrootscripts var that is under bashfiles
 ### up_script.sh

    eval $(parse_yaml YOURPATHTOCONFIG "config_")
    
### config
    Add this file to ~/.ssh/ to not have scp client pipe discconect break issues.
    
### rmuploaded.sh
    add this file to your crontab -e schedule to remove uploaded files normally  
