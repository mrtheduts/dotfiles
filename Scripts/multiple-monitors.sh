#!/bin/bash

HDMI='HDMI-A-0'
DP0='DisplayPort-0'
DP1='DisplayPort-1'
DP2='DisplayPort-2'

UWQHD_W='3440'
UWQHD_H='1440'

UWFHD_W='2560'
UWFHD_H='1080'

FHD_W='1920'
FHD_H='1080'

HD_W='1280'
HD_H='720'

toggle_screen() {
    SCREEN=$1
    RES_W=$2
    RES_H=$3
    ROT=$4

    if [ -n "$5" ]; then
        POS="--$5 $HDMI"
    fi
    echo "Pos: $POS"

    echo "Args: $SCREEN $RES_W $RES_H $ROT $POS"

    RES="${RES_W}x${RES_H}"
    echo "Res: $RES"

    XRANDR_LINE=$(xrandr --listactivemonitors | grep "$SCREEN")
    echo "xrandr output: $XRANDR_LINE"

    if [ -z "$XRANDR_LINE" ]; then
        xrandr --addmode "$SCREEN" "$RES"
        xrandr --output "$SCREEN" --mode "$RES" $POS --rotate "$ROT"
    else
        if [ -z "$(echo "$XRANDR_LINE" | grep "$RES_W")" ]; then
            xrandr --addmode "$SCREEN" "$RES"
            xrandr --output "$SCREEN" --mode "$RES" $POS --rotate $ROT
        else
            if [ "$SCREEN" != "$HDMI" ]; then
                xrandr --output "$SCREEN" --off
            fi
        fi
    fi
}

switch_2_hdmi() {
    XRANDR_LINE=$(xrandr --listactivemonitors | grep "$HDMI")

    if [ -z "$XRANDR_LINE" ]; then
        xrandr --output $DP0 --off
        xrandr --output $HDMI --mode "$FHD_W"x"$FHD_H"
    else
        xrandr --output $HDMI --off
        xrandr --output $DP0 --mode "$UWQHD_W"x"$UWQHD_H"
    fi
}

turn_all_off() {
    xrandr --output DisplayPort-0 --off
    xrandr --output DisplayPort-1 --off
    xrandr --output DisplayPort-2 --off
    # xrandr --output HDMI-A-0 --mode 2560x1080 --rotate normal --primary
    xrandr --output DisplayPort-0 --mode 3440x1440 --rotate normal --primary
    xrandr --output HDMI-A-0 --off
}

while getopts W:C:c:U:u:L:l:R:r:Swo flag
do
    case "$flag" in
        F) toggle_screen "$DP0"         "$UWQHD_W"   "$UWQHD_H" "$OPTARG"            ;;
        C) toggle_screen "$DP0"         "$FHD_W"     "$FHD_H"   "$OPTARG"            ;;
        c) toggle_screen "$DP0"         "$HD_W"      "$HD_H"    "$OPTARG"            ;;
        U) toggle_screen "$HDMI"        "$FHD_W"     "$FHD_H"   "$OPTARG" "above"    ;;
        u) toggle_screen "$HDMI"        "$HD_W"      "$HD_H"    "$OPTARG" "above"    ;;
        L) toggle_screen "$DP1"         "$FHD_W"     "$FHD_H"   "$OPTARG" "left-of"  ;;
        l) toggle_screen "$DP1"         "$HD_W"      "$HD_H"    "$OPTARG" "left-of"  ;;
        R) toggle_screen "$DP2"         "$FHD_W"     "$FHD_H"   "$OPTARG" "right-of" ;;
        r) toggle_screen "$DP2"         "$HD_W"      "$HD_H"    "$OPTARG" "right-of" ;;
        S) switch_2_hdmi ;;
        o) turn_all_off ;;
    esac
done

xrandr --output HDMI-A-0 --primary

