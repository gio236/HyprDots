#!/bin/bash

WALL=$(ls ~/.config/theme/actwall/ | head -1)
WALL_PATH="$HOME/.config/theme/actwall/$WALL"

killall hyprpaper 2>/dev/null

hyprpaper &
sleep 0.1

hyprctl hyprpaper wallpaper "HDMI-A-1,$WALL_PATH"
