watch -n 2 "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|time|rate|percentage'"
echo "wattage should be < 10-12W on battery"

