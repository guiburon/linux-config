#!/bin/sh

# set display resolution and monitor positions
~/.screenlayout/guiburon-laptop_linux.sh

# draw left and right wallpapers
feh --bg-fill /usr/share/backgrounds/guiburon/nh-apluto-wide-9-17-15-final_0.png

# us international keyboard layout without dead keys using right alt
setxkbmap -layout us -variant altgr-intl

# natural scrolling direction for touchpad
xinput set-prop 12 310 1
