#!/bin/sh

# Atualiza os repositórios em segundo plano
yay -Sy --noconfirm
if [ $? -ne 0 ]; then
  echo ":: Falha ao atualizar os repositórios."
  echo
  read -p "Pressione Enter para sair..."
  exit 1
fi

# Espera um pouco para garantir que a atualização dos repositórios tenha concluído
sleep 4

# Verifica as atualizações disponíveis usando yay
echo "Verificando atualizações disponíveis..."
updates=$(yay -Qu | wc -l)

if [ "$updates" -gt 0 ]; then
  echo "Atualizações disponíveis: $updates"
  echo "Listando pacotes desatualizados:"
  yay -Qu

  # Confirma se o usuário deseja iniciar a atualização
  if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA?"; then
    echo
    echo ":: Atualização iniciada."
    yay
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