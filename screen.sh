#!/bin/bash

#change these 4 variables accordingly
ORIG_X=1920
ORIG_Y=1080
NEW_X=1400
NEW_Y=1080
###

X_DIFF=$((- $NEW_X + $ORIG_X))
Y_DIFF=$(($NEW_Y - $ORIG_Y))

ORIG_RES="$ORIG_X"x"$ORIG_Y"
NEW_RES="$NEW_X"x"$NEW_Y"

ACTIVEOUTPUT=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
MODELINE=$(cvt $NEW_X $NEW_Y | grep Modeline | cut -d' ' -f3-)

xrandr --newmode $NEW_RES $MODELINE
xrandr --addmode $ACTIVEOUTPUT $NEW_RES
xrandr --output $ACTIVEOUTPUT --fb $NEW_RES --panning $NEW_RES --mode $NEW_RES
xrandr --fb $NEW_RES --output $ACTIVEOUTPUT --mode $ORIG_RES --transform 1,0,$X_DIFF,0,1,$Y_DIFF,0,0,1
