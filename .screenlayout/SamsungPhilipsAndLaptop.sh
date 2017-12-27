#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --primary --mode 3840x2160_51.00_rb2 --pos 1600x0 --rotate normal --output eDP-1 --mode 1600x900 --pos 0x1260 --rotate normal --output DP-2 --mode 1080pR --pos 5440x1080 --rotate normal --dpi 190
i3-msg reload
