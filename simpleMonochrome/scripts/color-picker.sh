#!/bin/bash

STATE_FILE="/tmp/waybar-color-picker-state"

pick_color() {
    color=$(hyprpicker -a -f hex)
    if [ -n "$color" ]; then
        # Remove # if present
        color="${color#\#}"

        # Convert to different formats
        hex="#$color"
        rgb=$(printf "%d, %d, %d" 0x${color:0:2} 0x${color:2:2} 0x${color:4:2})
        hsl=$(python3 -c "
import colorsys
r, g, b = int('${color:0:2}', 16)/255, int('${color:2:2}', 16)/255, int('${color:4:2}', 16)/255
h, l, s = colorsys.rgb_to_hls(r, g, b)
print(f'{int(h*360)}, {int(s*100)}%, {int(l*100)}%')
")

        # Save state
        echo "$hex|$rgb|$hsl" > "$STATE_FILE"
    fi
}

clear_color() {
    rm -f "$STATE_FILE"
}

output_json() {
    if [ -f "$STATE_FILE" ]; then
        IFS='|' read -r hex rgb hsl < "$STATE_FILE"

        tooltip="<b>HEX:</b> $hex\n<b>RGB:</b> rgb($rgb)\n<b>HSL:</b> hsl($hsl)\n\n<i>Click format to copy</i>"

        echo "{\"text\":\"󰈋\",\"tooltip\":\"$tooltip\",\"class\":\"active\"}"
    else
        echo "{\"text\":\"󰈋\",\"tooltip\":\"Pick a color\",\"class\":\"\"}"
    fi
}

case "$1" in
    pick)
        pick_color
        output_json
        ;;
    clear)
        clear_color
        output_json
        ;;
    *)
        output_json
        ;;
esac
