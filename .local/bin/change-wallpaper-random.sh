#!/bin/bash

# Diretório dos wallpapers
WALLPAPER_DIR="$HOME/.local/share/wallpapers"

# Seleciona um arquivo aleatório
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.jxl" -o -iname "*.webp" \) | shuf -n 1)

echo "📁 Selected file: $WALLPAPER"

if [ ! -f "$WALLPAPER" ]; then
  echo "Erro: $WALLPAPER não é um arquivo!"
  ls "$WALLPAPER"
  exit 1
fi

# Preload do wallpaper com hyprpaper
hyprctl hyprpaper preload "$WALLPAPER"
sleep 0.2 # pequeno delay para garantir que o preload seja processado

# Aplica o wallpaper com waypaper
waypaper --wallpaper "$WALLPAPER" --backend hyprpaper
echo "🖼️ Sent waypaper command to set $(basename "$WALLPAPER")"

matugen image "$WALLPAPER" -m "dark"

echo "✅ Wallpaper e cor aplicados com sucesso!"
