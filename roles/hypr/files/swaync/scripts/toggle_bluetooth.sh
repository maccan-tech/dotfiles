#!/usr/bin/env bash
# Bluetooth tile in the control center. swaync sets SWAYNC_TOGGLE_STATE to
# the new state of the toggle.
set +e # disable immediate exit on error

# bluetoothctl waits forever when bluetoothd is not running
if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
  {
    rfkill unblock bluetooth
    timeout 2 bluetoothctl power on
  } >/dev/null 2>&1 || :
else
  { timeout 2 bluetoothctl power off; } >/dev/null 2>&1 || :
fi

exit 0
