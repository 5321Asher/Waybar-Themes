#!/bin/bash

STATE_FILE="/tmp/waybar-color-picker-state"

if [ ! -f "$STATE_FILE" ]; then
    notify-send "Color Picker" "No color picked yet"
    exit 1
fi

IFS='|' read -r hex rgb hsl < "$STATE_FILE"

choice=$(printf "HEX: %s\nRGB: rgb(%s)\nHSL: hsl(%s)" "$hex" "$rgb" "$hsl" | wofi --dmenu --prompt "Copy format:")

case "$choice" in
    HEX*)
        echo -n "$hex" | wl-copy
        notify-send "Copied" "$hex"
        ;;
    RGB*)
        echo -n "rgb($rgb)" | wl-copy
        notify-send "Copied" "rgb($rgb)"
        ;;
    HSL*)
        echo -n "hsl($hsl)" | wl-copy
        notify-send "Copied" "hsl($hsl)"
        ;;
esac
