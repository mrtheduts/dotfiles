#!/usr/bin/env fish

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

set volume_change $argv[1]

if test -n $volume_change
    for sink in (pamixer --list-sinks | tail -n 2 | cut -f1 -d' ')
        if test "$volume_change"  = "m"
            pamixer --sink $sink -t
        else if test "$volume_change"  = "d" || test "$volume_change"  = "i"
            pamixer --sink $sink -u -$volume_change 5
        end
    end
end

