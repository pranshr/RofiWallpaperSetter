#!/bin/bash



dir=~/desktop-bg
options=$(ls $dir)

selection=$(echo $options | rofi -dmenu -sep ' ')
wallset $dir/$selection
