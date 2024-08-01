#! /bin/sh

# limpa a área de transferência
cliphist wipe

# Mata todos precessos do mako e define o caminho da configuração personalizada
killall mako
mako -c ~/.config/mako/customConfigs/clean_area_transf.conf &


notify-send "CLEAN CLIPBOARD"

sleep 4

# Mata todos os processo do mako para definir configuração padrão
killall mako