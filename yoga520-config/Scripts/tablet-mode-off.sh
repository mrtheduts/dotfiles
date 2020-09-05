#!/bin/bash
i3-msg bar mode hide
kill $(pgrep -x onboard)

xrandr -o normal

ID_WACOM=$(xinput | grep -i "Wacom" | cut -f 2 | cut -f 2 -d '=' | tr '\n' ' ')

set -f; IFS=' '
for ID in $ID_WACOM
do
    xsetwacom set $ID rotate none
done

exit 0
