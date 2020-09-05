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

# Name: move-window-to-corner
# Brief: In i3-wm, move the selected window to change its type to floating,
# resize it to a smaller size and move it to the corner-bottom-right
#
# Author: Eduardo "mrtheduts" Souza

# Base Values
base_screen_height=768

base_window_width=440
base_window_height=247

# Information fetching
window_id=$(i3-msg -t get_tree | jq 'recurse(.nodes[]) | select(.focused).window')
floating_window_id=$(i3-msg -t get_tree | jq -r '.nodes[].nodes[].nodes[]|.nodes[]+.floating_nodes[]|recurse(.nodes[])|select(.focused).id')
echo $window_id > log.txt
echo $floating_window_id >> log.txt

screen_width=$(xdpyinfo | awk '/dimensions:/ { print $2 }' |  cut -d x -f 1 )
screen_height=$(xdpyinfo | awk '/dimensions:/ { print $2 }' |  cut -d x -f 2 )

screen_window_proportion=$(echo "$screen_height/$base_screen_height" | bc -l)

base_window_width=$(printf "%.0f" $(echo "$screen_window_proportion*$base_window_width" | bc -l | tr '.' ','))
base_window_height=$(printf "%.0f" $(echo "$screen_window_proportion*$base_window_height" | bc -l | tr '.' ','))

window_pos_x=$(echo "$screen_width-$base_window_width" | bc -l)
window_pos_y=$(echo "$screen_height-$base_window_height" | bc -l)

if [[ $window_id != "" ]] ; then
    i3-msg "[id=\"$window_id\"] floating enable; resize set $base_window_width $base_window_height, sticky enable; move window to position $window_pos_x $window_pos_y;"
else
    i3-msg "[id=\"$floating_window_id\"] floating enable; resize set $base_window_width $base_window_height, sticky enable; move window to position $window_pos_x $window_pos_y;"

fi

