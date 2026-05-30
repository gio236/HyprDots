#!/usr/bin/env bash
# ─────────────────────────────────────────────
#  theme-switch.sh — switch themes via fuzzel
#  Place this script wherever you like and make
#  it executable with: chmod +x theme-switch.sh
# ─────────────────────────────────────────────

THEMES_DIR="$HOME/.config/theme"

# ── File map: theme-filename → destination ────────────────────────────────────
# Add new entries here to support more tools in the future.
declare -A FILE_MAP=(
  ["colors.ini"]="$HOME/.config/fuzzel/colors.ini"
  ["colors.toml"]="$HOME/.config/alacritty/colors.toml"
  ["color.css"]="$HOME/.config/waybar/color.css"
  ["colors.lua"]="$HOME/.config/hypr/colors.lua"
)

# ── Check that fuzzel is installed ────────────────────────────────────────────
if ! command -v fuzzel &>/dev/null; then
  echo "Error: fuzzel not found in PATH." >&2
  exit 1
fi

# ── Collect available themes (one directory = one theme) ──────────────────────
mapfile -t themes < <(
  find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort
)

if [[ ${#themes[@]} -eq 0 ]]; then
  echo "No themes found in $THEMES_DIR" >&2
  exit 1
fi

# ── Show the fuzzel picker ────────────────────────────────────────────────────
chosen=$(printf '%s\n' "${themes[@]}" | fuzzel --dmenu --prompt="Select theme: ")

# User pressed Esc or made no selection
if [[ -z "$chosen" ]]; then
  echo "No theme selected. Exiting." >&2
  exit 0
fi

THEME_PATH="$THEMES_DIR/$chosen"

if [[ ! -d "$THEME_PATH" ]]; then
  echo "Error: theme folder '$THEME_PATH' not found." >&2
  exit 1
fi

# ── Apply theme files ─────────────────────────────────────────────────────────
echo "Applying theme: $chosen"

applied=0
skipped=0

for filename in "${!FILE_MAP[@]}"; do
  src="$THEME_PATH/$filename"
  dst="${FILE_MAP[$filename]}"

  if [[ ! -f "$src" ]]; then
    # This theme doesn't include that file, skip silently
    continue
  fi

  # Create destination directory if it doesn't exist
  mkdir -p "$(dirname "$dst")"

  # Back up existing file (overwrites previous backup)
  if [[ -f "$dst" ]]; then
    cp "$dst" "${dst}.bak"
  fi

  # Copy the theme file to its destination
  if cp "$src" "$dst"; then
    echo "  ✓  $filename  →  $dst"
    ((applied++))
  else
    echo "  ✗  Failed to copy $filename to $dst" >&2
    ((skipped++))
  fi
done

echo ""
echo "$applied file(s) applied, $skipped error(s)."

# ── Reload services (waybar, etc.) ────────────────────────────────────────────
# Uncomment the lines below to automatically reload tools after switching.

# Reload waybar
# if pgrep -x waybar &>/dev/null; then
#     pkill -SIGUSR2 waybar && echo "  ↺  waybar reloaded"
# fi

# Reload other applications if needed
# killall -SIGUSR1 dunst 2>/dev/null

echo "Theme '$chosen' applied successfully."
