#!/bin/bash
path=/Volumes/MacPlexExternal5/PlexMedia/Death\ Note/
cd "$path"
echo $path


for x in *.mkv; do mv -- "$x" "${x//[][]}"; done

# " 720p Dual-Audio Multi-Sub x265 pseudo"
# "Anime RG " 
remove="AnimeRG "
for filename in *.mkv; do 
    [ -f "$filename" ] || continue
    mv "$filename" "${filename//$remove/}"
    echo $filename

done

remove1=" 720p Dual-Audio Multi-Sub x265 pseudo"
for filename in *.mkv; do 
    [ -f "$filename" ] || continue
    mv "$filename" "${filename//$remove1/}"
    echo $filename

done