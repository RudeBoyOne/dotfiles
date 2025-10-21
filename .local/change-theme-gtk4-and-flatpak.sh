#!/bin/bash

THEME_DIR="$HOME/.themes"

PS3="Por favor, escolha um tema GTK digitando o número correspondente: "

THEMES=$(ls -d "$THEME_DIR"/* | grep -vE '(-hdpi|-xhdpi)$' | xargs -n 1 basename)

echo "Escolha um tema GTK:"
echo ""
select THEME_NAME in $THEMES; do
  if [ -n "$THEME_NAME" ]; then
    THEME_PATH="${THEME_DIR}/$THEME_NAME"
    break
  fi
  echo "Seleção inválida. Tente novamente."
  echo ""
done

echo ""

echo "Verificando permissões do Flatpak..."
FLATPAK_OVERRIDES=$(sudo flatpak override --show)
if [[ $FLATPAK_OVERRIDES != *"$HOME/.themes"* ]]; then
  echo "Aplicando permissão para ler $HOME/.themes..."
  sudo flatpak override --filesystem=$HOME/.themes
else
  echo "Permissão para ler $HOME/.themes já aplicada."
fi

echo ""

echo "Aplicando tema GTK para aplicações Flatpak..."
sudo flatpak override --env=GTK_THEME="$THEME_NAME"

echo "Aplicando tema GTK4..."
rm -rf "${HOME}/.config/gtk-4.0/assets"
rm -f "${HOME}/.config/gtk-4.0/gtk.css"
rm -f "${HOME}/.config/gtk-4.0/gtk-dark.css"

# Verifica onde está o diretório assets e cria os links simbólicos
if [ -d "${THEME_PATH}/assets" ]; then
  ln -sf "${THEME_PATH}/assets" "${HOME}/.config/gtk-4.0/assets"
elif [ -d "${THEME_PATH}/gtk-4.0/assets" ]; then
  ln -sf "${THEME_PATH}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
fi

ln -sf "${THEME_PATH}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_PATH}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

echo "Aplicando tema GTK3..."
GTK3_CONFIG_FILE="${HOME}/.config/gtk-3.0/settings.ini"

# Cria o arquivo settings.ini se não existir
if [ ! -f "$GTK3_CONFIG_FILE" ]; then
  mkdir -p "${HOME}/.config/gtk-3.0"
  cat <<EOF > "$GTK3_CONFIG_FILE"
[Settings]
gtk-theme-name=$THEME_NAME
gtk-icon-theme-name=Colloid-Dark
gtk-font-name=Ubuntu Nerd Font Medium 10
gtk-cursor-theme-name=Bibata-Modern-Ice
gtk-cursor-theme-size=18
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_SMALL_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
gtk-application-prefer-dark-theme=0
gtk-decoration-layout=
EOF
else
  # Atualiza apenas a linha gtk-theme-name, preservando o restante
  if grep -q "gtk-theme-name=" "$GTK3_CONFIG_FILE"; then
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$THEME_NAME/" "$GTK3_CONFIG_FILE"
  else
    sed -i "/^\[Settings\]/a gtk-theme-name=$THEME_NAME" "$GTK3_CONFIG_FILE"
  fi
fi

echo "Atualizando configuração do Hyprland..."
HYPR_STARTUP_CONF="${HOME}/.config/hypr/components/startup.conf"

# Atualiza ou adiciona a variável GTK_THEME no arquivo startup.conf
if grep -q "^env = GTK_THEME," "$HYPR_STARTUP_CONF"; then
  sed -i "s/^env = GTK_THEME,.*/env = GTK_THEME,$THEME_NAME/" "$HYPR_STARTUP_CONF"
else
  echo "env = GTK_THEME,$THEME_NAME" >> "$HYPR_STARTUP_CONF"
fi

echo "Tema $THEME_NAME aplicado com sucesso para GTK3, GTK4, Flatpak e Hyprland."