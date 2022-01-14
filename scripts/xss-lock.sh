#!/bin/bash

## Partially lifted from https://github.com/vincentbernat/awesome-configuration/blob/master/bin/xss-lock
me="$(readlink -f "$0")"
timeout=240

case "$1" in
    start)
        xset s $timeout
        exec xss-lock -l $me lock
        ;;
    lock)
        ## TODO: log lock/unlock times
        exec $HOME/scripts/locker.sh
        ;;
esac
