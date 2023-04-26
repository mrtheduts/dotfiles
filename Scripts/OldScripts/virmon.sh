#!/bin/sh

FULLHD_1='1920/600x1080/250+0+0'
FULLHD_2='640/600x1080/250+1920+0'

HALF_1='1280/600x1080/250+0+0'
HALF_2='1280/600x1080/250+1280+0'

if [ $1 = "FHD" ]; then
    RES_1=$FULLHD_1
    RES_2=$FULLHD_2
else
    RES_1=$HALF_1
    RES_2=$HALF_2
fi

# Testing out virtual monitors
if [ -z "$(xrandr --listactivemonitors | grep 'HDMI-A-0~1')" ]; then
    xrandr --setmonitor HDMI-A-0~1 $RES_1 HDMI-A-0
    xrandr --setmonitor HDMI-A-0~2 $RES_2 none
    xrandr --fb 2560x1080
else
    xrandr --delmonitor HDMI-A-0~1
    xrandr --delmonitor HDMI-A-0~2
fi

