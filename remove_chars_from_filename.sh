#!/bin/bash
path="/Volumes/MacPlexExternal3/PlexMedia/Season 3/"
cd "$path"

echo $path
remove="[720p] [Dual-]"

for filename in *.kv; do 
    [ -f "$filename" ] || continue
    mv "$filename" "${filename//$remove/}"
    echo $filename

done