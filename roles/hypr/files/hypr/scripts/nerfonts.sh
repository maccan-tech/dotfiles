#!/bin/bash
#
# by maCCan (2023) 
#
cat ~/.config/rofi/nerdfont.txt | rofi -dmenu -i | awk '{print $1} ' | xsel -i -b
