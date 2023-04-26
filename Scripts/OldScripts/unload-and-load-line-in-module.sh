#!/usr/bin/env bash

NAME="pci-0000_0b_00.4"

echo "Grepping CARD ID..."
CARDID=$(pactl list cards | grep "HD-Audio Generic" -B 11 | grep "alsa.card =" | cut -d '"' -f2)

if [[ $CARDID == '' ]] ;
    then
        echo "Module not found. Aborting..."
        exit 1
fi

echo "CARDID=$CARDID"

echo "Grepping module number..."
MODULEID=$(pactl list modules | grep -B 2 "alsa_card.$NAME" | grep -i "módulo" | cut -d '#' -f2)

if [[ $MODULEID == '' ]] ;
    then
        echo "Module not found. Aborting..."
        exit 1
fi

# echo "MODULEID=$MODULEID"
# echo "Unloading MODULEID..."
# pactl unload-module $MODULEID

echo "Loading new module..."
# pactl load-module module-alsa-card \
    # device_id="$CARDID" \
    # name="$NAME" \
    # card_name="alsa_card.$NAME" \
    # namereg_fail=false \
    # tsched=yes \
    # fixed_latency_range=yes \
    # ignore_dB=no \
    # deferred_volume=yes \
    # use_ucm=yes \
    # card_properties="module-udev-detect.discovered=1" \
    # fragments=1 \
    # fragment_size=15

echo "Verifying if loopback module exists..."
LOOPBACKID=$(pactl list modules | grep -B 1 "module-loopback" | grep -i "módulo" | cut -d '#' -f2)
echo "LoopbackID=$LOOPBACKID"

if [[ $LOOPBACKID == '' ]] ;
then
    echo "Loading loopback module..."
    pactl load-module module-loopback latency_msec=1
fi

exit 0
