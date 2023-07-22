#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar --config="/home/soumava/.config/polybar/config.ini" &

if [[ $(xrandr | grep -w connected | wc -l ) -eq 2 ]]; then
    polybar external_polybar --config="/home/soumava/.config/polybar/config.ini" &
fi
