setxkbmap \
  -model "pc105" \
  -layout "us,bg" \
  -variant ",bas_phonetic" \
  -option grp:caps_toggle \
  -option terminate:ctrl_alt_bksp

#localectl --no-convert set-x11-keymap us,bg pc105 ,bas_phonetic grp:caps_toggle,terminate:ctrl_alt_bksp
