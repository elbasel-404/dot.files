#!/usr/bin/env bash

# Path to the directory containing application icons
ICON_DIR="$HOME/.local/share/icons/hicolor/128x128/apps"

# Function to get an icon based on the window title
get_icon() {
    # Normalize the window title (convert to lowercase and remove spaces for matching)
    app_name=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '_')

    # Search for an icon matching the app name in the icons directory
    icon_file=$(find "$ICON_DIR" -type f -iname "*$app_name*.png" | head -n 1)

    # If an icon is found, return its absolute path, otherwise return a default icon
    if [ -n "$icon_file" ]; then
        echo "$icon_file"
    else
        # Return a default icon path if no match is found
        echo "$ICON_DIR/generic-icon.png"
    fi
}

# Get the list of window clients in JSON format and parse it using jq
client_list=$(hyprctl -j clients | jq 'map({
  workspace_id: .workspace.id, 
  workspace_name: .workspace.name, 
  title: .title, 
  address: .address
})' |
    sed "s/,$//; s/^\[//; s/^\]//; s/^[[:blank:]]*//; s/^\"//; s/\"$//" |
    grep -v "^$")

# Build the window list with icons by combining the application name (window title) and the associated icon
client_list_with_icons=""
while read -r client; do
    # Extract the title of the window (application name)
    title=$(echo "$client" | jq -r '.title')
    address=$(echo "$client" | jq -r '.address')

    # Get the icon based on the application name (window title)
    icon=$(get_icon "$title")

    # Format the window details with the icon (using the absolute path)
    workspace_name=$(echo "$client" | jq -r '.workspace_name')
    client_list_with_icons+="$icon $workspace_name ┇ $title ┇ $address"$'\n'
done <<<"$client_list"

# Use wofi to display the list of windows with icons in alphabetical order and allow images
# The user selects a window, and we extract the address (a hex value) of the selected window
selected_address=$(echo "$client_list_with_icons" | wofi --allow-images -dO alphabetical | grep -o "0x.*$")

# Dispatch the focus to the selected window by address
hyprctl dispatch focuswindow address:"$selected_address"
