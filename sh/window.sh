#!/usr/bin/env bash

# Get clients from Hyprland
clients=$(hyprctl -j clients)

# Build menu list
menu=""
while IFS= read -r row; do
    app_class=$(echo "$row" | jq -r '.class // "UnknownApp"')
    workspace=$(echo "$row" | jq -r '.workspace.name')
    address=$(echo "$row" | jq -r '.address')

    [ -z "$address" ] && continue
    menu+="[$workspace] $app_class ┇ $address"$'\n'
done < <(echo "$clients" | jq -c '.[]')

[ -z "$menu" ] && exit 1

# Show Wofi menu using default style
selected=$(echo "$menu" | sort -k2 | wofi --dmenu)

# Extract address
address=$(echo "$selected" | awk -F' ┇ ' '{print $2}')

# Focus window
[ -n "$address" ] && hyprctl dispatch focuswindow address:"$address"
