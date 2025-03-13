#!/bin/sh
##############################
# Start Waybar
##############################

# ----------------------------------------------------- 
# Quit running waybar instances
# ----------------------------------------------------- 
killall waybar

# ----------------------------------------------------- 
# Loading the configuration based on the username
# ----------------------------------------------------- 
if [[ $USER = "raabe" ]]
then
    waybar -c ~/.config/waybar/myconfig & -s ~/.config/waybar/style.css  
else
    LC_TIME="sv_SE.utf8" waybar &
fi 
