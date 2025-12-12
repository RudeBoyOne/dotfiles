#!/bin/bash

# Função para instalar yay caso não esteja instalado
install_yay() {
  if ! command -v yay &> /dev/null; then
    echo "yay não encontrado. Instalando yay..."
    echo
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
  else
    echo "yay já está instalado."
    echo
  fi
}

# Instalar yay se necessário
install_yay

# Atualizar pacotes existentes
echo "Atualizando pacotes existentes..."
yay -Syu --noconfirm

# Instalar pacotes necessários, listados linha por linha
echo "Instalando os pacotes..."
yay -S --noconfirm \
  hyprland \
  hyprpaper \
  hyprlock \
  xdg-desktop-portal-hyprland \
  hyprpolkitagent \
  hyprland-qt-support \
  hyprqt6engine \
  hyprcursor \
  hyprutils \
  hyprlang \
  aquamarine \
  hyprgraphics \
  hyprpicker \
  hyprshot \
  kitty \
  nautilus \
  firefox \
  thunderbird \
  smile \
  visual-studio-code-bin \
  telegram-desktop \
  waybar \
  waypaper \
  swaync \
  matugen

echo "Todos os programas foram instalados com sucesso!"
