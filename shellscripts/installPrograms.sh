#!/bin/bash

# Atualizar pacotes existentes
echo "Atualizando pacotes existentes..."
yay

# Instalar pacotes necessários, listados linha por linha
echo "Instalando todos os pacotes necessários..."
yay -S \
  kitty \
  nautilus \
  firefox \
  thunderbird \
  hyprpicker \
  rofi \
  smile \
  hyprshot \
  hyprlock \
  wleave \
  code \
  telegram-desktop \
  wasistlos \
  waybar \
  waypaper \
  kvantum \
  kvantum-qt5 \
  kvantum-qt6 \
  nwg-look

echo "Todos os programas foram instalados com sucesso!"
