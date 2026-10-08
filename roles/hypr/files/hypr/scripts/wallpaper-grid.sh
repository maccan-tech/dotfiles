#!/bin/bash
#
# Wallpaper picker: rofi grid of cached thumbnails, applied live via hyprpaper IPC.
#
# The chosen wallpaper is stored as a symlink that hyprpaper.conf and
# hyprlock.conf both read, so the choice survives restarts and the lock
# screen follows it.

WALLPAPER_DIR="$(xdg-user-dir PICTURES 2>/dev/null || echo "$HOME/Pictures")/Wallpapers"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/wallpaper"
CURRENT_LINK="$STATE_DIR/current"
THUMB_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/wallpaper-picker"
THUMB_SIZE=400

for cmd in rofi magick hyprctl; do
    if ! command -v "$cmd" &> /dev/null; then
        notify-send "Wallpaper" "$cmd is not installed"
        exit 1
    fi
done

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Wallpaper" "$WALLPAPER_DIR does not exist"
    exit 1
fi

mkdir -p "$STATE_DIR" "$THUMB_DIR"

mapfile -d '' images < <(find -L "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \
       -o -iname '*.gif' -o -iname '*.bmp' -o -iname '*.jxl' \) -print0 | sort -z)

if [ "${#images[@]}" -eq 0 ]; then
    notify-send "Wallpaper" "No images found in $WALLPAPER_DIR"
    exit 1
fi

# Thumbnail name includes size and mtime, so an edited image gets a new one
thumb_for() {
    local key
    key=$(stat -Lc '%n:%s:%Y' "$1" | md5sum | cut -d ' ' -f 1)
    echo "$THUMB_DIR/$key.jpg"
}

# Square center-cropped thumbnails: rofi always reserves a square box for
# icons, so a square crop fills it instead of leaving empty bands
missing=()
for img in "${images[@]}"; do
    thumb=$(thumb_for "$img")
    [ -f "$thumb" ] || missing+=("$img" "$thumb")
done

if [ "${#missing[@]}" -gt 0 ]; then
    notify-send -t 2000 "Wallpaper" "Creating $((${#missing[@]} / 2)) thumbnails..."
    printf '%s\0' "${missing[@]}" | xargs -0 -n 2 -P "$(nproc)" \
        sh -c 'magick "$1[0]" -auto-orient -thumbnail "'"$THUMB_SIZE"'x'"$THUMB_SIZE"'^" \
               -gravity center -extent "'"$THUMB_SIZE"'x'"$THUMB_SIZE"'" -strip -quality 85 "$2.tmp.jpg" \
               && mv -f "$2.tmp.jpg" "$2"' _
fi

current=$(readlink -f "$CURRENT_LINK" 2>/dev/null)
current_row=0
menu=""
for i in "${!images[@]}"; do
    img="${images[$i]}"
    name=$(basename "${img%.*}")
    menu+="${name}\0icon\x1f$(thumb_for "$img")\n"
    [ "$(readlink -f "$img")" = "$current" ] && current_row=$i
done

selected_row=$(echo -en "$menu" | rofi -dmenu -i -show-icons -format i \
    -selected-row "$current_row" -a "$current_row" \
    -config ~/.config/rofi/config-wallpaper.rasi \
    -p "Wallpaper")

[ -z "$selected_row" ] && exit 0

WALLPAPER_PATH="${images[$selected_row]}"
ln -sfn "$WALLPAPER_PATH" "$CURRENT_LINK"

# Apply live on every monitor without restarting hyprpaper (no black flash)
if pgrep -x hyprpaper > /dev/null; then
    hyprctl -j monitors | jq -r '.[].name' | while read -r monitor; do
        hyprctl hyprpaper wallpaper "$monitor, $WALLPAPER_PATH, cover" > /dev/null
    done
else
    hyprpaper > /dev/null 2>&1 &
fi
