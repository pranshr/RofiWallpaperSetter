#!/bin/bash



dir=~/desktop-bg
# wallpapers=$(find $dir -mindepth 1 -printf "%P|" | awk '{print substr($0, 1, length($0)-1)}')

declare -A images

options=""
for file in in "$dir"/*; do

    images[" \0icon\x1f$file"]="$file"

    if [ -z "$options" ]; then
        options="$file\0icon\x1f$file"
    else
        options="$options|$file\0icon\x1f$file"
    fi
done

selection=$(echo -e $options | rofi -dmenu -sep '|' -show-icons)
wallset "$selection"
