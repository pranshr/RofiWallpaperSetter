#!/bin/bash



dir=""  # your dir here...

declare -A images

options=""
for file in "$dir"/*; do

    images[" \0icon\x1f$file"]="$file"

    if [ -z "$options" ]; then
        options="$file\0icon\x1f$file"
    else
        options="$options|$file\0icon\x1fthumbnail://$file"
    fi
done

selection=$(echo -en $options | rofi \
                                -dmenu \
                                -sep '|' \
                                -show-icons \
                                -cycle)
wallset "$selection"
