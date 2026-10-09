#!/bin/sh
##############################
# Start Waybar
##############################

# -----------------------------------------------------
# Quit running waybar instances and wait until they are gone, otherwise the
# new bar can start next to the old one
# -----------------------------------------------------
pkill -x waybar
while pgrep -x waybar > /dev/null; do
    sleep 0.1
done

LC_TIME="sv_SE.utf8" exec waybar
