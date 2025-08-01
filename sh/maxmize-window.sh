MONITOR=$(hyprctl monitors -j | jq -r '.[0]')
X=$(echo "$MONITOR" | jq '.x')
Y=$(echo "$MONITOR" | jq '.y')
WIDTH=$(echo "$MONITOR" | jq '.width')
HEIGHT=$(echo "$MONITOR" | jq '.height')

# Optional: subtract some pixels for gaps/borders (adjust as needed)
GAP=10
WIDTH=$((WIDTH - GAP*2))
HEIGHT=$((HEIGHT - GAP*2))

# Make current window floating
hyprctl dispatch togglefloating

# Move to top-left corner of monitor (plus gap)
hyprctl dispatch moveactive $((X + GAP)) $((Y + GAP))

# Resize to usable area
hyprctl dispatch resizeactive "$WIDTH" "$HEIGHT"
