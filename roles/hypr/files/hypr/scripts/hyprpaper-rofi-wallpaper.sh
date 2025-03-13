#!/bin/bash

# Path to wallpaper directory
WALLPAPER_DIR="$HOME/wallpaper"

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# Check if rofi is installed
if ! command -v rofi &> /dev/null; then
    echo "Error: rofi is not installed. Please install it first."
    exit 1
fi

# Check if hyprpaper is installed
if ! command -v hyprpaper &> /dev/null; then
    echo "Error: hyprpaper is not installed. Please install it first."
    exit 1
fi

# Change to the wallpaper directory
cd "$WALLPAPER_DIR" || exit 1

# Build the menu with thumbnails
# This creates a list where each wallpaper name is associated with its own path as an icon
MENU_ITEMS=""
for img in *.jpg *.jpeg *.png *.gif *.bmp; do
    # Skip if the wildcard didn't match any files
    [ -f "$img" ] || continue
    
    # Use spaces for the display name so it's minimally visible
    # but still maintains the entry in rofi
    DISPLAY_NAME="   "
    
    # Add the filename with its full path as the icon
    FULL_PATH="$WALLPAPER_DIR/$img"
    MENU_ITEMS="${MENU_ITEMS}${img}\0icon\x1f${FULL_PATH}\n"
done

# Check if any wallpapers were found
if [ -z "$MENU_ITEMS" ]; then
    echo "Error: No image files found in $WALLPAPER_DIR"
    exit 1
fi

# Use rofi to select a wallpaper with thumbnails
# The -i flag makes the search case-insensitive
# The -show-icons flag enables icon display
SELECTED_WALLPAPER=$(echo -e "$MENU_ITEMS" | rofi -dmenu -i -show-icons -config ~/.config/rofi/config-singlecol.rasi -p "Select wallpaper")

# Remove the temporary config file
rm "$TMP_CONFIG"

# Check if a wallpaper was selected
if [ -z "$SELECTED_WALLPAPER" ]; then
    echo "No wallpaper selected. Exiting."
    exit 0
fi

# Full path to the selected wallpaper
WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED_WALLPAPER"

# Get the monitor name using hyprctl
MONITOR=$(hyprctl monitors | grep -m 1 "Monitor" | awk '{print $2}')

# If we can't detect the monitor, use a default one
if [ -z "$MONITOR" ]; then
    MONITOR="eDP-1" # Default monitor name, change if needed
fi

# Create or update hyprpaper configuration
CONFIG_DIR="$HOME/.config/hypr"
mkdir -p "$CONFIG_DIR"
CONFIG_FILE="$CONFIG_DIR/hyprpaper.conf"

# Create a new hyprpaper config
echo "preload = $WALLPAPER_PATH" > "$CONFIG_FILE"
echo "wallpaper = $MONITOR,$WALLPAPER_PATH" >> "$CONFIG_FILE"

# Kill any existing hyprpaper instance with killall instead of pkill
killall hyprpaper 2>/dev/null

# Start hyprpaper with the new config
hyprpaper &

echo "Wallpaper set to $SELECTED_WALLPAPER"
exit 0
