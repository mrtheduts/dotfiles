#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=$(polybar --list-monitors| cut -d ':' -f1 | sort -n | head -n 1) polybar $1 &

echo "Bars launched..."
