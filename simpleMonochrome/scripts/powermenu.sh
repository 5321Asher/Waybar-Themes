#!/bin/bash

# Increased height to show all 4 options
choice=$(echo -e " Shutdown\n Reboot\n Logout" | wofi --dmenu --prompt "Power Menu" --width 250 --height 280)

case $choice in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Logout")
        hyprctl dispatch exit
        ;;
esac
