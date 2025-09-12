#!/bin/bash

SELECTED=$(find ~/wallpaper \
    -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \)  \
    | shuf |
    while read -r img; do
        echo -en "$img\0icon\x1f$img\n"
    done \
| rofi -dmenu -show-icons -theme "~/.config/rofi/wallselect/style.rasi")

if [ $(pgrep -c hyprpaper) -ne 0 ] && [ -n "$SELECTED" ]; then
    hyprctl hyprpaper unload all
    killall hyprpaper
fi

# Get the monitor name using hyprctl
MONITOR=$(hyprctl monitors | grep -m 1 "Monitor" | awk '{print $2}')

# If we can't detect the monitor, use a default one
if [ -z "$MONITOR" ]; then
    MONITOR="eDP-1" # Default monitor name, change if needed
fi

CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"
# Create a new hyprpaper config
echo "preload = $SELECTED" > "$CONFIG_PATH"
echo "wallpaper = $MONITOR,$SELECTED" >> "$CONFIG_PATH"
echo "splash = off" >> "$CONFIG_PATH"
echo "ipc = off" >> "$CONFIG_PATH"

# add if for when esc i pressed and no image is selected
hyprpaper &
