#!/bin/bash
path="/Users/grantduvall/Workspace/Plex/test/"
cd "$path"
echo $path

for x in *.txt; do mv -- "$x" "${x//[][]}"; done


remove="hitest hello"
for filename in *.txt; do 
    [ -f "$filename" ] || continue
    mv "$filename" "${filename//$remove/}"
    echo $filename

done

