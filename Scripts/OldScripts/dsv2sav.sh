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

# Name: dsv2sav
# Brief: Remove DeSmuME footer from a dsv file to sav and vice versa.
# Author: Eduardo "mrtheduts" Souza

FOOTER='\x7c\x3c\x2d\x2d\x53\x6e\x69\x70\x20\x61\x62\x6f\x76\x65\x20\x68\x65\x72\x65\x20\x74\x6f\x20\x63\x72\x65\x61\x74\x65\x20\x61\x20\x72\x61\x77\x20\x73\x61\x76\x20\x62\x79\x20\x65\x78\x63\x6c\x75\x64\x69\x6e\x67\x20\x74\x68\x69\x73\x20\x44\x65\x53\x6d\x75\x4d\x45\x20\x73\x61\x76\x65\x64\x61\x74\x61\x20\x66\x6f\x6f\x74\x65\x72\x3a\x01\x02\x00\x00\x00\x20\x00\x00\x02\x00\x00\x00\x02\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x7c\x2d\x44\x45\x53\x4d\x55\x4d\x45\x20\x53\x41\x56\x45\x2d\x7c'
UPDATEALL=0

function usage {
        echo "./$(basename $0) [options] FILES"
        echo "-u        Converts all most recent files in current directory to the opposite filetype (.dsv <-> .sav)"
        echo "-H <file> Custom footer to be appended"
        echo "-h        Prints this menu and exits"
}

# list of arguments expected in the input
optstring=":uH:h"

while getopts ${optstring} arg; do
  case ${arg} in
    u)
      if [ "$#" -ne 1 ]; then
          echo "$0: Error: -u flag must be used without FILES argument"
          exit 1
      fi
      UPDATE=1
      ;;
    H)
      if [ -f "$OPTARG" ];
      then
        echo "Using $OPTARG as footer to create .dsv"
        FOOTER=$(cat "$OPTARG")
      else
          echo "$0: Error: $OPTARG does not exist."
        exit 2
      fi
      ;;
    h)
      usage
      exit 1
      ;;
    :)
      echo "$0: Error: Must supply an argument to -$OPTARG." >&2
      exit 1
      ;;
    ?)
      echo "$0: Error: Invalid option: -${OPTARG}."
      exit 2
      ;;
  esac
done

if [ $UPDATEALL -eq 0 ];
then
    FILES="$@"
else
    echo "in development :)"
    exit 0
fi

for FILE in "$FILES"
do
    echo "Curr file: $FILE"
    if [[ -f "$FILE" ]];
    then
        echo "Exists: $FILE"
        case "$FILE" in
            *.dsv)
                echo "It's a dsv"
                BASENAME=$(basename -- "$FILE" .dsv)
                cp "$FILE" ./"$BASENAME".sav
                truncate -s -122 "$BASENAME".sav
                ;;
            *.sav)
                echo "It's a sav"
                BASENAME=$(basename -- "$FILE" .sav)
                # cat "$FILE" <($FOOTER) > "$BASENAME".dsv
                cp "$FILE" ./"$BASENAME".dsv
                echo -ne "$FOOTER" >> "$BASENAME".dsv
                ;;
            ?)
                echo "Unsupported filetype."
                exit 3
                ;;
        esac
    else
        echo "$OPTARG does not exist."
        exit 2
    fi
done

# hx <(echo -n -e "$FOOTER")
