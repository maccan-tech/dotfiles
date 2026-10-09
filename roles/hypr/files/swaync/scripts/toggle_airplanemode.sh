#!/usr/bin/env bash
# Airplane mode button in the control center. swaync sets SWAYNC_TOGGLE_STATE
# to the new state of the toggle.
set +e # disable immediate exit on error

# bluetoothctl waits forever when bluetoothd is not running
if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
  {
    nmcli radio wifi off
    timeout 2 bluetoothctl power off
    rfkill block all
  } >/dev/null 2>&1 || :
  notify-send -a "swaync" "󰀝 Airplane mode enabled"
else
  {
    rfkill unblock all
    nmcli radio wifi on
    timeout 2 bluetoothctl power on
  } >/dev/null 2>&1 || :
  notify-send -a "swaync" "󰀞 Airplane mode disabled"
fi

exit 0
