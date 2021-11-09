#!/bin/bash
# script I used on my laptop to set the correct resolution
# when I connect it to my external monitor

xrandr --output DP-1-3 --left-of eDP-1
xrandr --output DP-1-3 --mode 2560x1440
feh --bg-scale ~/.wallpaper.png
