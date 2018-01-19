#!/bin/sh
synclient -l | sed 's/Parameter settings://;s/ //g' > ~/.synclientSettings
