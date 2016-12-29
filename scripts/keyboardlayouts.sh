setxkbmap \
  -model "pc105" \
  -layout "us,bg" \
  -variant ",bas_phonetic" \
  -option grp:lalt_lshift_toggle \
  -option caps:backspace \
  -option terminate:ctrl_alt_bksp

#localectl --no-convert set-x11-keymap us,bg pc105 ,bas_phonetic grp:lalt_lshift_toggle,caps:backspace,terminate:ctrl_alt_bksp
