#!/bin/bash

themes_dir="~/.config/rofi/launchers"
type="type-4"
style="style-2"
wallpaper_dir="$HOME/.local/share/wallpapers"

select_wallpaper=$(ls "${wallpaper_dir}" | rofi -show -dmenu -p "  Wallpaper"   -theme "${themes_dir}/${type}/${style}.rasi")

if [ -n "$select_wallpaper" ]; then
    hyprctl hyprpaper unload all

    wal_tpl=$(cat $HOME/.config/hypr/templates/hyprpaper.tpl)
    output=${wal_tpl//MONITOR/$monitor}
    output=${wal_tpl//WALLPAPER/"${wallpaper_dir}/$select_wallpaper"}
    echo "$output" > $HOME/.config/hypr/hyprpaper.conf

    sleep 2
    hyprctl hyprpaper preload "${wallpaper_dir}/${select_wallpaper}"
    hyprctl hyprpaper wallpaper "DP-1, ${wallpaper_dir}/${select_wallpaper}"
else
    # Opcional: Mensagem ou ação a ser executada se 'select_wallpaper' estiver vazia
    echo "A variável 'select_wallpaper' está vazia, nenhum wallpaper selecionado!"
fi
