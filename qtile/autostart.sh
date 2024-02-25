#!/bin/sh

# set display resolution and monitor positions
~/.screenlayout/guiburon-laptop_linux.sh

# draw left and right wallpapers
feh --bg-fill ~/Pictures/wallpapers/wallpaper

# natural scrolling direction for touchpad
xinput set-prop 12 297 1
