#!/bin/sh
echo "Verificando atualizações disponíveis..."
updates=$(/home/lucas/.config/waybar/scripts/check-updates.sh)

sleep 3

if [ "$updates" -gt 0 ]; then
  echo "Atualizações disponíveis: $updates"
  echo "Listando pacotes desatualizados:"
  checkupdates-with-aur
  echo

  if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA?"; then
    echo
    echo ":: Atualização iniciada."
    yay -Syu --noconfirm
    if [ $? -ne 0 ]; then
      echo ":: Falha durante a atualização dos pacotes."
      read -p "Pressione Enter para sair..."
      exit 1
    fi
  elif [ $? -eq 130 ]; then
    exit 130
  else
    echo
    echo ":: Atualização cancelada."
    read -p "Pressione Enter para sair..."
    exit
  fi
else
  echo
  echo ":: Nenhuma atualização disponível."
  sleep 3
fi

echo
echo ":: Atualização concluída com sucesso!"
echo
read -p "Pressione Enter para sair..."