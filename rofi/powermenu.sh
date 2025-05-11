#!/bin/bash

# Options for powermenu
lock="  Lock"  
logout="  Logout" 
shutdown="  Shutdown"
reboot="  Reboot"
sleep="  Sleep"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "Hasklug Nerd Font 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

# Do something based on selected option
case $selected_option in
    "$lock")
        betterlockscreen -l
        ;;
    "$logout")
        i3-msg exit
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$sleep")
        systemctl suspend
        ;;
    *)
        echo "No match"
        ;;
esac
