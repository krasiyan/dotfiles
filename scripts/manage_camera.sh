#!/bin/sh

case $1 in
on) modprobe uvcvideo > /dev/null
  ;;
off) modprobe -r uvcvideo > /dev/null
  ;;
*)
  echo "invalid command" 1>&2
  exit 1
;;
esac
