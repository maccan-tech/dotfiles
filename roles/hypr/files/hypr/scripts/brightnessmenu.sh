#!/bin/bash

# options do be displayed
option0="2 %"
option1="20 %"
option2="40 %"
option3="60 %"
option4="80 %"
option5="100 %"

# options passed to variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5"

selected="$(echo -e "$options" | rofi -lines 5 -dmenu -p "Backlight")"
case $selected in
    $option0)
      brightnessctl set 2%;;
		  # sudo bash -c "echo <2%> > /sys/class/backlight/intel_backlight/brightness";;
    $option1)
      brightnessctl set 20%;;
      # sudo bash -c "echo <20%> > /sys/class/backlight/intel_backlight/brightness";;
    $option2)
      brightnessctl set 40%;;
      # sudo bash -c "echo <40%> > /sys/class/backlight/intel_backlight/brightness";;
  	$option3)
      brightnessctl set 60%;;
      # sudo bash -c "echo <60%> > /sys/class/backlight/intel_backlight/brightness";;
	  $option4)
      brightnessctl set 80%;;
      # sudo bash -c "echo <80%> > /sys/class/backlight/intel_backlight/brightness";;
	  $option5)
      brightnessctl set 100%;;
      # sudo bash -c "echo <100%> > /sys/class/backlight/intel_backlight/brightness";;
esac
