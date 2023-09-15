#!/bin/bash

STREAM_1="1920/600x1080/250+0+0"
STREAM_2="1920/600x360/250+0+1080"
STREAM_3="1520/600x1440/250+1920+0"

WQHD="3440x1440"
QHD_1='2560/600x1440/250+0+0'
QHD_2='880/600x1440/250+2560+0'

QHD_HALF_1='1720/600x1440/250+0+0'
QHD_HALF_2='1720/600x1440/250+1720+0'

WFHD="2560x1080"
FHD_1='1920/600x1080/250+0+0'
FHD_2='640/600x1080/250+1920+0'

FHD_HALF_1='1280/600x1080/250+0+0'
FHD_HALF_2='1280/600x1080/250+1280+0'

NAME=$(xrandr --listactivemonitors | grep "0" | cut -d '+' -f 2 | cut -d ' ' -f 1)

if [ $1 = "QHD" ]; then
    RES=$WQHD
    RES_1=$QHD_1
    RES_2=$QHD_2
elif [ $1 = "QHD_HALF" ]; then
    RES=$WQHD
    RES_1=$QHD_HALF_1
    RES_2=$QHD_HALF_2
elif [ $1 = "FHD" ]; then
    RES=$WFHD
    RES_1=$FHD_1
    RES_2=$FHD_2
elif [ $1 = "FHD_HALF" ]; then
    RES=$WFHD
    RES_1=$FHD_HALF_1
    RES_2=$FHD_HALF_2
elif [ $1 = "STREAM" ]; then
    RES=$WFHD
    RES_1=$FHD_HALF_1
    RES_2=$FHD_HALF_2
fi

echo "$NAME"

# Testing out virtual monitors
if [ -z "$NAME" ]; then
    echo "Deleting monitors"
    xrandr --delmonitor DisplayPort-0~1
    xrandr --delmonitor DisplayPort-0~2
    xrandr --delmonitor DisplayPort-0~3
    xrandr --delmonitor HDMI-A-0~1
    xrandr --delmonitor HDMI-A-0~2
elif [ $1 = "STREAM" ]; then
    echo "Creating stream"
    xrandr --setmonitor $NAME~1 $STREAM_1 $NAME
    xrandr --setmonitor $NAME~2 $STREAM_3 none
    xrandr --setmonitor $NAME~3 $STREAM_2 none
    xrandr --fb $WQHD
elif [ -z "$(xrandr --listactivemonitors | grep \"$NAME\")" ]; then
    echo "Creating monitors"
    xrandr --setmonitor $NAME~1 $RES_1 $NAME
    xrandr --setmonitor $NAME~2 $RES_2 none
    xrandr --fb $RES
fi

