#!/usr/bin/env bash

# Copyright (C) mrtheduts
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

# Name: easy-tablet-mode
# Brief: This shell script was designed for a Lenovo Yoga 520-14LKB to 
# automate tablet mode detection and rotate screen and Wacom devices 
# accordingly to its accelerometer. It also has an option to run two custom
# scripts - when tablet mode is activated and when it's deactivated.
# As kernel 5.2.2 does not support this yoga model lid flip, it watches 
# for an "Unknown event: 10" (also known as "lid flip") in dmesg to happen 
# to activate tablet mode.
# Author: Eduardo "mrtheduts" Souza


# Default values
event_name_tablet_on="ideapad_laptop: Unknown event: 10"
event_name_tablet_off=""
diff_event_names=0

sleep_time="1"

script_tablet_on=""
script_tablet_off=""

accel_device="/sys/bus/iio/devices/iio:device0"

# Screen accelerometer coordinates
# A Y
# |
# |
# 0----> X
# Z
accel_threshold_x=8
accel_threshold_y=8
accel_threshold_z=5

is_tablet_mode=0

# Active devices (finger pen) on each mode
devices_actv_note=( 0 1 )
devices_actv_tblt=( 0 1 )

# Print help menu
usage () {

    echo "Usage:"
    echo "$0 <opt> [arg]"
    echo ""
    echo "Options:"
    echo "- Event name:"
    echo "Event names this script should watch for to enter and exit tablet mode. If there is only one event, give only one argument."
    echo -e "\tUsage:"
    echo -e "\t-E \"event_tablet_m_on\",\"event_name_tablet_off\""
    echo -e "\tUsage:"
    echo -e "\tExamples:"
    echo -e "\tDifferent event names for entering and exiting tablet mode."
    echo -e "\t $0 -E \"ideapad_laptop: Entering tablet mode\",\"ideapad_laptop: Exiting tablet mode\""
    echo -e "\tEqual event names for entering and exiting tablet mode."
    echo -e "\t $0 -E \"ideapad_laptop: switch mode\",\"\""
    echo ""
    echo "- Sleep time:"
    echo "Change default sleep time (1s) for lookup on mode change events and accelerometer files."
    echo -e "\tUsage:"
    echo -e "\t -t time_in_seconds"
    echo -e "\tExample (change sleep time to 10s):"
    echo -e "\t$0 -t 10"
    echo ""
    echo "- Enter/exit tablet mode scripts:"
    echo "Execute given scripts or commands when notebook enters and exits tablet mode. Both scripts are optional (you may only want to execute a script when exiting tablet mode, for example)."
    echo -e "\tUsage:"
    echo -e "\t-s \"/path/to/scriptA\",\"/path/to/scriptB\""
    echo -e "\tExamples:"
    echo -e "\tExecute script only when exiting tablet mode."
    echo -e "\t-s \"\",\"/home/nice_user/exit_script.sh\""

}

# Options treatment
optspec=':E:t:s:D:a:W:Thv'

while getopts "$optspec" opt;
do

    case $opt in

        # Events names
        # The argument should be in the following format:
        # -E "event name 1","event name 2" for, respectively, activating
        # and deactivating tablet mode for different events.
        # If they are equal, -E "event name" will suffice.
        E)
            set -f; IFS=','
            arg_array=("$2")

            if [[ ${#arg_array[@]} -gt 2 ]] ; then
                echo "Invalid argument: Event name should not have commas/should have maximum of two events names."
                echo "More information on $0 -h."
                exit 2

            elif [[ ${#arg_array[@]} == 1 ]] ; then
                event_name_tablet_on=${arg_array[0]}
                event_name_tablet_off=${arg_array[0]}

            else
                event_name_tablet_on=${arg_array[0]}
                event_name_tablet_off=${arg_array[1]}
                diff_event_names=1
            fi
        ;;

        # Sleep time
        # Makes sure given argument is a number.
        # Time in seconds. 
        t)
            if [[ $(awk "BEGIN {print ($OPTARG/$OPTARG==1)}") == 1 ]] 2>/dev/null ; then
                sleep_time="$OPTARG"
            else
                echo "Invalid argument: $OPTARG is not a valid period of time (in seconds)"
                echo "More information on $0 -h"
                exit 3
            fi
        ;;

        # Scripts to be executed on activate and deactivate tablet mode
        # Checks if given files exists. Doesn't run them yet, run-related 
        # errors will be dealt with further along. Arguments should be in the
        # following format:
        # -s "/path/to/script1 its arguments","/path/to/script2 its arguments"
        s)
            script_tablet_on=$(sed "s/\~/\/home\/$USER/g" <<< "$(cut -d ',' -f1 <<< "$OPTARG")")
            script_tablet_off=$(sed "s/\~/\/home\/$USER/g" <<< "$(cut -d ',' -f2 <<< "$OPTARG")")

            echo "Script path on: $script_tablet_on"
            echo "Script path off: $script_tablet_off"

            if [[ "$script_tablet_on" != "" ]] ; then
                if [[ ! ( -f $(cut -d ' ' -f1 <<< "$script_tablet_on")) ]] ; then
                    echo "Invalid argument: $script_tablet_on does not exist or it's not a file"
                    echo "More information on $0 -h."
                    exit 4
                fi
            fi

            if [[ "$script_tablet_off" != "" ]] ; then
                if [[ ! (-f $(cut -d ' ' -f1 <<< "$script_tablet_off")) ]] ; then
                    echo "Invalid argument: $script_tablet_off does not exist or it's not a file"
                    echo "More information on $0 -h."
                    exit 5
                fi
            fi
        ;;

        # Accelerometer Device
        # Checks if device folder exists, as well as its 
        # in_accel_{x,y,z}_raw and in_accel_scale files
        D)
            accel_device="$OPTARG"

            if [[ ! -d $accel_device ]] ; then
                echo "Invalid argument: device not found"
                echo "More information on $0 -h."
                exit 6
            else
                for axis in 'x' 'y' 'z' ; do
                    if [[ ! -f "$accel_device"/in_accel_"$axis"_raw ]] ; then
                        echo "Invalid argument:" "$accel_device"/in_accel_"$axis"_raw "does not exist. Device might not be compatible with this script"
                        exit 7
                    fi
                done

                if [[ ! -f "$accel_device"/in_accel_scale ]] ; then
                        echo "Invalid argument:" "$accel_device"/in_accel_scale "does not exist. Device might not be compatible with this script"
                fi

            fi
        ;;

        # Accelerometer threshold values
        # Values in m/s^2 of x,y and z coordinates to activate autorotation.
        # Leave a field blank (as in "8,,8") if you want to disable the
        # influence of a specific axis in the rotation
        a) 
            set -f; IFS=','
            arg_array=("$2")

            accel_threshold_x=${arg_array[0]}
            accel_threshold_y=${arg_array[1]}
            accel_threshold_z=${arg_array[2]}
        ;;

        # Starts in tablet mode
        T)
            is_tablet_mode=1
        ;;

        # Set which Wacom devices should be active in each mode
        # Format: -W "finger pen","finger pen" is, respectively,
        # to notebook mode and tablet mode. If you want a device to be
        # deactivated for a mode, omit its name, as in -W "","finger"
        # Possible devices are: finger, pen
        W)
            
            devices_actv_note=( 0 0 )
            devices_actv_tblt=( 0 0 )

            set -f; IFS=','
            arg_array=("$2")

            if [[ ${arg_array[0]} =~ "finger" ]] ; then
                    devices_actv_note[0]=1
            fi
            if [[ ${arg_array[0]} =~ "pen" ]] ; then
                    devices_actv_note[1]=1
            fi
            if [[ ${arg_array[1]} =~ "finger" ]] ; then
                    devices_actv_tblt[0]=1
            fi
            if [[ ${arg_array[1]} =~ "pen" ]] ; then
                    devices_actv_tblt[1]=1
            fi

        ;;

        h)
            usage
            exit 1

        ;;

        \?)
            usage
            exit 1
        ;;

        :)
            echo "Invalid option: $OPTARG requires an argument"
            exit 1
        ;;
    esac
done

declare -a old_screen_ori
declare -a new_screen_ori

# Check Accelerometer
# Brief: decide which side to rotate to accordingly to default or given accel thresholds
# and updates new_screen_ori
# Arguments: none
# Returns: none
check_accel () {

    accel_z="$(bc <<< "$(cat "$accel_device"/in_accel_z_raw)*$(cat "$accel_device"/in_accel_scale)")"
    accel_z=${accel_z//-/0}
    echo "$accel_z"

    if [[ $accel_threshold_z != "" && (($(bc <<< "$accel_z < $accel_threshold_z"))) ]] || [[ $accel_threshold_z == "" ]]; then

        accel_x=$(bc <<< "$(cat "$accel_device"/in_accel_x_raw)*$(cat "$accel_device"/in_accel_scale)")
        accel_y=$(bc <<< "$(cat "$accel_device"/in_accel_y_raw)*$(cat "$accel_device"/in_accel_scale)")

        if (($(bc <<< "$accel_y < -$accel_threshold_y")))  ; then
            new_screen_ori=( normal none )
        elif (($(bc <<< "$accel_y > $accel_threshold_y")))  ; then
            new_screen_ori=( inverted half )
        elif (($(bc <<< "$accel_x > $accel_threshold_x")))  ; then
            new_screen_ori=( left ccw )
        elif (($(bc <<< "$accel_x < -$accel_threshold_x")))  ; then
            new_screen_ori=( right cw )
        fi
    fi


}

# Actual script starts here
# It has two ways of checking if the mode has been changed. One if there are
# two distincts events and another if there isn't.

# Fetch Wacom pointers ID
ID_WACOM=$(xinput | grep -i "Wacom" | cut -f 2 | cut -f 2 -d '=' | tr '\n' ' ')
ID_TOUCH=$(xinput | grep -i "Wacom" |grep -i "Touch" | cut -f 2 | cut -f 2 -d '=' | tr -d '\n')

if ((is_tablet_mode)) ; then
    if [[ ${devices_actv_tblt[0]} == "0" ]] ; then
        xinput disable "$ID_TOUCH"
    else
        xinput enable "$ID_TOUCH"
    fi

else
    if [[ ${devices_actv_note[0]} == "0" ]] ; then
        xinput disable "$ID_TOUCH"
    else
        xinput enable "$ID_TOUCH"
    fi
fi

if ((diff_event_names)) ; then

    on_events_count=$(dmesg -L=never -P | grep -c "$event_name_tablet_on")
    off_events_count=$(dmesg -L=never -P | grep -c "$event_name_tablet_off")

    while true ; do

        if [[ on_events_count -gt off_events_count ]] ; then

            is_tablet_mode=1

            if [[ $script_tablet_on != "" ]] ; then
                $script_tablet_on &
            fi

#                if [[ ${devices_actv_tblt[0]} == "0" ]] ; then
#                    xinput disable $ID_TOUCH
#                else
#                    xinput enable $ID_TOUCH
#                fi
                    
        else

            is_tablet_mode=0

            if [[ $script_tablet_off != "" ]] ; then
                $script_tablet_off &
            fi

#                if [[ ${devices_actv_note[0]} == "0" ]] ; then
#                    xinput disable $ID_TOUCH
#                else
#                    xinput enable $ID_TOUCH
#                fi
        fi

        if ((is_tablet_mode)) ; then
            check_accel

            if [[ ${new_screen_ori[0]} != "" && ${old_screen_ori[0]} != "${new_screen_ori[0]}" ]] ; then
                set -f; IFS=' '
                xrandr -o "${new_screen_ori[0]}"

                set -f; IFS=' '
                for ID in $ID_WACOM
                do
                    xsetwacom set "$ID" rotate "${new_screen_ori[1]}"
                done

                old_screen_ori=("${new_screen_ori[@]}")
            fi

        fi

        sleep "$sleep_time"s

    done
else
    old_events_count=$(bc <<< "$(dmesg -L=never -P | grep -c "$event_name_tablet_on")%2")

    while true ; do

        new_events_count=$(bc <<< "$(dmesg -L=never -P | grep -c "$event_name_tablet_on")%2")

        if [[ old_events_count -ne new_events_count ]] ; then
            is_tablet_mode=$((1-is_tablet_mode))
            old_events_count=$new_events_count

            if ((is_tablet_mode)) ; then
                if [[ $script_tablet_on != "" ]] ; then
                    $script_tablet_on &
                fi

#                if [[ ${devices_actv_tblt[0]} == "0" ]] ; then
#                    xinput disable $ID_TOUCH
#                else
#                    xinput enable $ID_TOUCH
#                fi

                    
            else
                if [[ $script_tablet_off != "" ]] ; then
                    $script_tablet_off &
                fi

#                if [[ ${devices_actv_note[0]} == "0" ]] ; then
#                    xinput disable $ID_TOUCH
#                else
#                    xinput enable $ID_TOUCH
#                fi
            fi
        fi

        if ((is_tablet_mode)) ; then
            check_accel

            if [[ ${new_screen_ori[0]} != "" && ${old_screen_ori[0]} != "${new_screen_ori[0]}" ]] ; then
                set -f; IFS=' '
                xrandr -o "${new_screen_ori[0]}"

                set -f; IFS=' '
                for ID in $ID_WACOM
                do
                    xsetwacom set "$ID" rotate "${new_screen_ori[1]}"
                done

                old_screen_ori=("${new_screen_ori[@]}")
            fi

        fi

        # echo $is_tablet_mode

        sleep "$sleep_time"s
    done
fi

