#!/bin/bash
#   ____ _ _       _     _     _    
#  / ___| (_)_ __ | |__ (_)___| |_  
# | |   | | | '_ \| '_ \| / __| __| 
# | |___| | | |_) | | | | \__ \ |_  
#  \____|_|_| .__/|_| |_|_|___/\__| 
#           |_|                     
#  
# ----------------------------------------------------- 

case $1 in
    d) cliphist list | rofi -dmenu -i -p "Delete" -config ~/.config/rofi/config-cliphist.rasi | cliphist delete
       ;;

    w) if [ "$(echo -e "Clear\nCancel" | rofi -dmenu -p "Clear clipboard history?" -l 2 -config ~/.config/rofi/config-singlecol.rasi)" = "Clear" ] ; then
            cliphist wipe
       fi
       ;;

    *) cliphist list | rofi -dmenu -i -p "Clipboard" -config ~/.config/rofi/config-cliphist.rasi | cliphist decode | wl-copy
       ;;
esac
