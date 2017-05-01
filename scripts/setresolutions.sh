#!/bin/sh
xrandr --newmode "1080pR" 138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync
xrandr --addmode HDMI-1 "1080pR"
xrandr --addmode DP-2 "1080pR"
