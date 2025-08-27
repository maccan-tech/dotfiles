#!/bin/bash

save_dir="$HOME/Pictures/screenshots/"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
mkdir -p $save_dir
swpy_dir="$HOME/.config/swappy"
mkdir -p $swpy_dir
echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > $swpy_dir/config

option2="Selected area"
option3="Window"
option4="Fullscreen (delay 1 sec)"

options="$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -config ~/.config/rofi/config-singlecol.rasi -l 4 -width 30 -p "Take Screenshot")

case $choice in
    $option2)
      pkill slurp || hyprshot -m ${1:-region} --raw |
        satty --filename - \
          --output-filename "$save_dir/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
          --early-exit \
          --actions-on-enter save-to-clipboard \
          --save-after-copy \
          --copy-command 'wl-copy'
    ;;
    $option3)
      pkill slurp || hyprshot -m window --raw |
        satty --filename - \
          --output-filename "$save_dir/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
          --early-exit \
          --actions-on-enter save-to-clipboard \
          --save-after-copy \
          --copy-command 'wl-copy'
    ;;
    $option4)
      sleep 1
      pkill slurp || hyprshot -m output -m active --raw |
        satty --filename - \
          --output-filename "$save_dir/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
          --early-exit \
          --actions-on-enter save-to-clipboard \
          --save-after-copy \
          --copy-command 'wl-copy'
    ;;
esac
u-l 4 -width 30 -p "Take Screenshot")

