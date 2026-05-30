#!/bin/bash

WALL=$(ls ~/.config/theme/actwall/ | head -1)
WALL_PATH="$HOME/.config/theme/actwall/$WALL"

killall hyprpaper 2>/dev/null
sleep 0.5

hyprpaper &
sleep 1

hyprctl hyprpaper preload "$WALL_PATH"
hyprctl hyprpaper wallpaper "HDMI-A-1,$WALL_PATH"
