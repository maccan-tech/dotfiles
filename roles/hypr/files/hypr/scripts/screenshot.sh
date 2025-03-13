#!/bin/bash

save_dir="$HOME/Pictures/screenshots/"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
mkdir -p $save_dir
swpy_dir="$HOME/.config/swappy"
mkdir -p $swpy_dir
echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > $swpy_dir/config


option2="Selected area"
option3="Fullscreen (delay 1 sec)"

options="$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -l 4 -width 30 -p "Take Screenshot")

case $choice in
    $option2)
      grim -g "$(slurp)" - | swappy -f - 
      # dunstify $ncolor "theme" -a "saved in $save_dir" -i "$save_dir/$save_file" -r 91190 -t 4200 --urgency="normal"
      # dunstify $ncolor "theme" -a "saved in $save_dir" -r 91190 -t 4200 --icon="~/.config/dunst/icons/screenshot.svg" --urgency="normal"
      dunstify "Screenshot" "saved in $save_dir" -i ~/.config/dunst/icons/screenshot.svg -u "normal"
    ;;
    $option3)
      sleep 1
      grim - | swappy -f -
      # dunstify $ncolor "theme" -a "saved in $save_dir" -r 91190 -t 4200 --icon="~/.config/dunst/icons/screenshot.svg" --urgency="normal"
      dunstify "Screenshot" "saved in $save_dir" -i ~/.config/dunst/icons/screenshot.svg -u "normal"
    ;;
esac
