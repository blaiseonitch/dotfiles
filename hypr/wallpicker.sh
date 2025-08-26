#!/bin/bash

WALLDIR="$HOME/Pictures/wallpaper"

# Get full paths of images, sorted
mapfile -t FILES < <(find "$WALLDIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.jpeg' \) | sort)

# Extract only filenames for rofi menu
FILENAMES=()
for f in "${FILES[@]}"; do
  FILENAMES+=("$(basename "$f")")
done

# Show rofi with just filenames
CHOICE=$(printf '%s\n' "${FILENAMES[@]}" | rofi -dmenu -p "Pick wallpaper")

# Exit if nothing selected
[ -z "$CHOICE" ] && exit

# Find full path of the chosen filename
for i in "${!FILENAMES[@]}"; do
  if [[ "${FILENAMES[$i]}" == "$CHOICE" ]]; then
    SELECTED_PATH="${FILES[$i]}"
    break
  fi
done

# Set wallpaper with swww
swww img "$SELECTED_PATH" --transition-type any --transition-duration 1 && wal -i "$SELECETED_PATH"

