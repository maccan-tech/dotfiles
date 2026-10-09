#!/bin/sh
##############################
# Start Waybar
##############################

# Settings from the settings menu (Alt+Shift+S): a config and a style that
# include ~/.config/waybar/config and style.css and override parts of them
WAYBAR_CONFIG="${XDG_STATE_HOME:-$HOME/.local/state}/hypr/waybar.jsonc"
WAYBAR_STYLE="${XDG_STATE_HOME:-$HOME/.local/state}/hypr/waybar.css"

# -----------------------------------------------------
# Quit running waybar instances and wait until they are gone, otherwise the
# new bar can start next to the old one
# -----------------------------------------------------
pkill -x waybar
while pgrep -x waybar > /dev/null; do
    sleep 0.1
done

if [ ! -f "$WAYBAR_CONFIG" ]; then
    LC_TIME="sv_SE.utf8" exec waybar
fi

[ -f "$WAYBAR_STYLE" ] || WAYBAR_STYLE="$HOME/.config/waybar/style.css"
LC_TIME="sv_SE.utf8" exec waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE"
