#!/bin/bash

# Path to wallpaper directory
WALLPAPER_DIR="$HOME/wallpaper"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist."
    exit 1
fi

if ! command -v rofi &> /dev/null; then
    echo "Error: rofi is not installed. Please install it first."
    exit 1
fi

if ! command -v hyprpaper &> /dev/null; then
    echo "Error: hyprpaper is not installed. Please install it first."
    exit 1
fi

cd "$WALLPAPER_DIR" || exit 1

# Build menu items with full image paths as icons
MENU_ITEMS=""
for img in *.jpg *.jpeg *.png *.gif *.bmp; do
    [ -f "$img" ] || continue
    FULL_PATH="$WALLPAPER_DIR/$img"
    MENU_ITEMS="${MENU_ITEMS}${img}\0icon\x1f${FULL_PATH}\n"
done

if [ -z "$MENU_ITEMS" ]; then
    echo "Error: No image files found in $WALLPAPER_DIR"
    exit 1
fi

# Show wallpapers as a horizontal grid with thumbnails, no visible text
SELECTED_WALLPAPER=$(echo -e "$MENU_ITEMS" | rofi -dmenu -i -show-icons \
    -config ~/.config/rofi/config-wallpaper.rasi \
    -p "Wallpaper")

if [ -z "$SELECTED_WALLPAPER" ]; then
    exit 0
fi

WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED_WALLPAPER"

# Get the monitor name using hyprctl
MONITOR=$(hyprctl monitors | grep -m 1 "Monitor" | awk '{print $2}')
if [ -z "$MONITOR" ]; then
    MONITOR="eDP-1"
fi

# Update hyprpaper configuration
CONFIG_DIR="$HOME/.config/hypr"
mkdir -p "$CONFIG_DIR"
CONFIG_FILE="$CONFIG_DIR/hyprpaper.conf"

echo "preload = $WALLPAPER_PATH" > "$CONFIG_FILE"
echo "wallpaper = $MONITOR,$WALLPAPER_PATH" >> "$CONFIG_FILE"

killall hyprpaper 2>/dev/null
hyprpaper &

echo "Wallpaper set to $SELECTED_WALLPAPER"
exit 0
