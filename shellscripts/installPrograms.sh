#!/bin/bash

# Função para instalar yay caso não esteja instalado
install_yay() {
  if ! command -v yay &>/dev/null; then
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
  xdg-desktop-portal-hyprland \
  hyprcursor \
  hyprutils \
  hyprpicker \
  kitty \
  thunderbird \
  visual-studio-code-bin \
  telegram-desktop \
  uwsm \
  yazi \
  ffmpeg \
  7zip \
  jq \
  poppler \
  fd \
  ripgrep \
  fzf \
  zoxide \
  resvg \
  imagemagick \
  bibata-cursor-theme-bin \
  btop \
  qt6ct-kde \
  noctalia \
  noctalia-greeter \
  zen-browser-bin \
  vicinae-bin \
  darkly-bin

echo "Todos os programas foram instalados com sucesso!"
