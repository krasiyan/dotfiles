#!/bin/sh

xdotool key XF86AudioStop && \
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause > /dev/null || true && \
xkblayout-state set 0 && \
XSECURELOCK_AUTH_BACKGROUND_COLOR=#002b36 XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_SHOW_USERNAME=0 xsecurelock
