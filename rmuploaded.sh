#!/bin/bash
cd /Users/tmac/Movies/Plex/Uploaded/
echo $(ls -a) >> /Users/$USER/Movies/Plex/Lists/removed_items.txt
rm -rf *
