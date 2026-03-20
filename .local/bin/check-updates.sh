#!/bin/bash

set -euo pipefail

# =============================================================================
# VERIFICAÇÃO DE DEPENDÊNCIAS
# =============================================================================
if ! command -v checkupdates &>/dev/null; then
  echo "❌ Erro: 'checkupdates' não está instalado."
  echo "   Instale com: yay -S pacman-contrib"
  exit 1
fi

if ! command -v yay &>/dev/null; then
  echo "❌ Erro: 'yay' não está instalado."
  echo "   Instale seguindo: https://github.com/Jguer/yay#installation"
  exit 1
fi

count_updates() {
  local official=0
  local aur=0

  # Conta atualizações oficiais
  official=$(checkupdates 2>/dev/null | wc -l) || official=0

  # Conta atualizações do AUR
  aur=$(yay -Qua 2>/dev/null | wc -l) || aur=0

  echo $((official + aur))
}

# Retorna o número de atualizações
updates=$(count_updates)
echo "$updates"
