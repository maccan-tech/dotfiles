#!/bin/bash

# Visa listan i rofi och spara det användaren väljer
chosen_file=$(trash-list | cut -d' ' -f3- | rofi -dmenu -mesg "Restore File" -config ~/.config/rofi/trash/style.rasi)

# Om användaren valde något (inte avbröt med Esc t.ex.)
if [[ -n "$chosen_file" ]]; then
    printf "0\n" | trash-restore "$chosen_file"
    notify-send "Restored" "$chosen_file"
fi

