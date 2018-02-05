#!/bin/sh
xrandr --output eDP-1-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off --dpi 192 && \
    xfconf-query -c xsettings -p /Xft/DPI -s 192 && \
    i3-msg restart
