#!/usr/bin/env bash
# Prints true or false for a toggle button in the control center, run by
# swaync as "update-command" every time the control center opens.
#
# swaync runs update commands as /bin/sh -c "<command>", so double quotes
# inside a command in config.json break it; the checks live here instead.
#
# Usage: toggle_state.sh wifi|bluetooth|airplane|sound|mic|nightlight

case "$1" in
  wifi)
    # nmcli reports the radio as enabled even without a wifi card
    nmcli -t -f TYPE device | grep -qx wifi && [ "$(nmcli radio wifi)" = enabled ]
    ;;
  bluetooth)
    # bluetoothctl waits forever when bluetoothd is not running
    timeout 2 bluetoothctl show 2> /dev/null | grep -qF "Powered: yes"
    ;;
  airplane)
    # On when there are radios and all of them are blocked
    rfkill list | grep -q "Soft blocked: yes" && ! rfkill list | grep -q "Soft blocked: no"
    ;;
  sound)
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q "Mute: yes"
    ;;
  mic)
    pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "Mute: yes"
    ;;
  nightlight)
    pgrep -x hyprsunset > /dev/null
    ;;
  *)
    false
    ;;
esac && echo true || echo false
