TRACKBALL_ID=$(xinput list | grep "Kensington Expert Wireless TB Mouse" | head -n 1 | sed -r 's/.*id=([0-9]+).*/\1/')

# bottom left: left
# bottom right: right
# top right: middle
# top left: back
xinput --set-button-map ${TRACKBALL_ID} 1 8 3 4 5 6 7 2 9

# top right button panning (middle click)
xinput set-prop ${TRACKBALL_ID} "libinput Button Scrolling Button" 8
xinput set-prop ${TRACKBALL_ID} "libinput Scroll Method Enabled" 0, 0, 1

# slow down acceleration
xinput set-prop ${TRACKBALL_ID} "libinput Accel Speed" 0.3

# acceleration: adaptive: disabled, flat: enabled
xinput set-prop ${TRACKBALL_ID} "libinput Accel Profile Enabled" 0, 1
xinput set-prop ${TRACKBALL_ID} "libinput Accel Profiles Available" 0, 1
