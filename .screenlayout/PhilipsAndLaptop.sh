#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --mode 1600x900 --pos 0x180 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 1600x0 --rotate normal --output DP2 --mode 1920x1080 --pos 3520x0 --rotate normal
xfce4-panel -r
