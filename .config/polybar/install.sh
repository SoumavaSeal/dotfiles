#!/usr/bin/env bash

if [ -d ~/.config/polybar/ ]; then
    mkdir -p ~/.config/polybar/polybar_backup
    mv ~/.config/polybar/* ~/.config/polybar/polybar_backup
else
    mkdir -p ~/.config/polybar
fi

mv launch.sh config.ini modules.ini colors.ini ~/.config/polybar/
