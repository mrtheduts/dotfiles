#!/usr/bin/env bash

NAME="usb-0d8c_USB_Sound_Device-00"

echo "Grepping CARD ID..."
CARDID=$(pactl list cards | grep "CM106 Like Sound Device" -B 11 | grep "alsa.card =" | cut -d '"' -f2)

if [[ $CARDID == '' ]] ;
    then
        echo "Module not found. Aborting..."
        exit 1
fi

echo "CARDID=$CARDID"

echo "Grepping USB_Sound module number..."
MODULEID=$(pactl list modules | grep -B 2 "alsa_card.usb-0d8c_USB_Sound_Device-00" | grep -i "módulo" | cut -d '#' -f2)

if [[ $MODULEID == '' ]] ;
    then
        echo "Module not found. Aborting..."
        exit 1
fi

echo "MODULEID=$MODULEID"
pactl unload-module $MODULEID

pactl load-module module-alsa-card device_id="$CARDID" name="$NAME" card_name="alsa_card.$NAME" namereg_fail=false tsched=no fixed_latency_range=yes ignore_dB=no deferred_volume=yes use_ucm=yes card_properties="module-udev-detect.discovered=1" fragments=2 fragment_size=50

LOOPBACKID=$(pactl list modules | grep -B 1 "module-loopback" | grep -i "módulo" | cut -d '#' -f2)
# pacat -r --latency-msec=1 -d "alsa_input.$NAME.analog-stereo" | pacat -p --latency-msec=1 -d SINK-NAME
if [[ $LOOPBACKID == '' ]] ;
then
    echo "Loading loopback module..."
    pactl load-module module-loopback latency_msec=1
fi

exit 0
