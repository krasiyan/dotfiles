#!/bin/sh

xdotool key XF86AudioStop && \
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause > /dev/null || true && \
xkblayout-state set 0 && \
i3lock --color "#002b36" -n -e -f
