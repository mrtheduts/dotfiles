#!/usr/bin/env bash

echo "Grepping WACOMID..."
WACOMID=$(xinput | grep -i "Pen" | cut -f 2 | cut -f 2 -d '=' | tr '\n' ' ')
echo "WACOMID=$WACOMID" >> log_toggle.log
echo "Grepping TOUCHID..."
TOUCHID=$(xinput list --id-only "Wacom HID 5107 Finger touch")
echo "TOUCHID=$TOUCHID" >> log_toggle.log

echo "Verifying if touchscreen is enabled..." >> log_toggle.log

if [[ $(xinput list-props "$TOUCHID" | grep -i "enabled" | grep -o '[0-9]*' | tail -n 1) == "1" ]] ; then
    echo "Touchscreen is enable. Grepping COREID..." >> log_toggle.log
    COREID=$(xinput list --id-only "Virtual core pointer")
    echo "COREID=$COREID" >> log_toggle.log
    echo "Grepping SECONDID..." >> log_toggle.log
    SECONDID=$(xinput list --id-only "Second pointer")
    echo "SECONDID=$SECONDID" >> log_toggle.log >> log_toggle.log

    echo "Iterating through WACOMID..." >> log_toggle.log
    for ID in $WACOMID
    do
        echo "Attaching $ID to $COREID..." >> log_toggle.log
        xinput reattach "$ID" "$COREID"
    done

    echo "Removing master $SECONDID..." >> log_toggle.log
    xinput remove-master "$SECONDID"
    echo "Disabling $TOUCHID..." >> log_toggle.log
    xinput disable "$TOUCHID"

else

    echo "Touchscreen is not enabled. Creating Second master..." >> log_toggle.log
    xinput create-master Second
    echo "Grepping Second Pointer..." >> log_toggle.log
    SECONDID=$(xinput list --id-only "Second pointer")
    echo "SECONDID=$SECONDID" >> log_toggle.log

    echo "Iterating through WACOMID..." >> log_toggle.log
    for ID in $WACOMID
    do
        echo "Attaching $ID to $SECONDID..." >> log_toggle.log
        xinput reattach "$ID" "$SECONDID"
    done

    echo "Enabling $TOUCHID..." >> log_toggle.log
    xinput enable "$TOUCHID"

fi

echo "Exiting Script." >> log_toggle.log
echo "" >> log_toggle.log

exit 0

