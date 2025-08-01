#!/run/current-system/sw/bin/zsh

#export PATH="/home/elbasel/.nix-profile/bin:/run/current-system/sw/bin:$PATH"
WALLPAPER_DIR="/home/elbasel/media/wall/"
CURRENT_WALL=$(/run/current-system/sw/bin/hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | app -- shuf -n 1)

# Apply the selected wallpaper
/run/current-system/sw/bin/hyprctl hyprpaper reload ,"$WALLPAPER"
