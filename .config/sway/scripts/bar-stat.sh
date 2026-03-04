#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

if [ "$status" = "Charging" ]; then
    battery="⚡$capacity%"
else
    battery="🔋$capacity%"
fi

current_date="$(date '+%d-%m-%Y')"
current_time="$(date "+%X")"

output="$battery        📅 $current_date        🕒 $current_time"

echo $output
