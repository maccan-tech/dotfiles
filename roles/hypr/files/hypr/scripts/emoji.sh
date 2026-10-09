#!/bin/bash
#
# Emoji picker (Alt+.): rofimoji in the shared rofi style. Enter types the
# emoji into the focused window (wtype); Alt+C copies it instead.

exec rofimoji \
    --action type \
    --skin-tone neutral \
    --prompt "Emoji" \
    --selector-args="-config $HOME/.config/rofi/config-emoji.rasi" \
    "$@"
