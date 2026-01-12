#!/bin/bash


# Theme
theme=style.rasi

# Variables
source ./var.sh
declare -A images


# Building the options
options=""
for file in "$dir"/*; do

    images[" \0icon\x1f$file"]="$file"

    if [ -z "$options" ]; then
        options="$file\0icon\x1f$file"
    else
        options="$options|$file\0icon\x1fthumbnail://$file"
    fi
done


# Running Rofi and getting wallpaper, then executing the command for changing the wallpaper
selection=$(echo -en $options | rofi \
                                -dmenu \
                                -sep '|' \
                                -theme $theme \
                                -mesg "$msg")
wallset "$selection"
