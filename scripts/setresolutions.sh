#!/bin/sh
xrandr --newmode "1080pR" 138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync
xrandr --addmode HDMI-1 "1080pR"
xrandr --addmode DP-2 "1080pR"

xrandr --newmode "3840x2160_51.00_rb2"  442.22  3840 3848 3880 3920  2160 2198 2206 2212 +hsync -vsync
xrandr --addmode DP-1 "3840x2160_51.00_rb2"
