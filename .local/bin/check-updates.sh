#!/bin/bash

count_updates() {
  local official=0
  local aur=0

  # Conta atualizações oficiais (checkupdates ou pacman)
  if command -v checkupdates &>/dev/null; then
    official=$(checkupdates 2>/dev/null | wc -l)
  else
    official=$(pacman -Qu 2>/dev/null | wc -l)
  fi

  # Conta atualizações do AUR
  if command -v yay &>/dev/null; then
    aur=$(yay -Qua 2>/dev/null | wc -l)
  fi

  echo $((official + aur))
}

# Retorna o número de atualizações
updates=$(count_updates)
echo "$updates"

