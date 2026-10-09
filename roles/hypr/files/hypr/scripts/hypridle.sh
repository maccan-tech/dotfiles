#!/bin/bash
#
# Start hypridle with the timeouts chosen in the settings menu (Alt+Shift+S),
# or with the default ~/.config/hypr/hypridle.conf if none have been chosen.

IDLE_CONF="${XDG_STATE_HOME:-$HOME/.local/state}/hypr/hypridle.conf"

if [ -f "$IDLE_CONF" ]; then
    exec hypridle -c "$IDLE_CONF"
fi
exec hypridle
