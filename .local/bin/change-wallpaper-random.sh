#!/bin/bash

# Monitor
MONITOR="DP-1"

# Arquivo de configuração do hyprpaper
HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

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

# Set wallpaper com hyprpaper
hyprctl hyprpaper wallpaper "$MONITOR","$WALLPAPER"
sleep 0.2 # pequeno delay para garantir que o preload seja processado

# Persiste o wallpaper no arquivo de configuração do hyprpaper
if [ -f "$HYPRPAPER_CONF" ]; then
  echo $HYPRPAPER_CONF
  tmp="$(mktemp)"
  sed "/wallpaper[[:space:]]*{/,/^[[:space:]]*}/ s|^[[:space:]]*path[[:space:]]*=.*$|    path = $WALLPAPER|" "$HYPRPAPER_CONF" >"$tmp" && mv "$tmp" "$HYPRPAPER_CONF"
fi

matugen image "$WALLPAPER" -m "dark"

echo "✅ Wallpaper e cor aplicados com sucesso!"
