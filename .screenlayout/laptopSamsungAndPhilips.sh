#!/bin/sh
xrandr --output eDP-1-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --mode 1920x1080 --pos 7680x1080 --rotate normal --output DP-2 --off --output DP-1 --off --output DP-0 --primary --mode 3840x2160 --pos 3840x0 --rotate normal --dpi 192 && \
    xfconf-query -c xsettings -p /Xft/DPI -s 192 && \
    i3-msg restart
