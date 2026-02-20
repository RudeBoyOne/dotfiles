#!/bin/bash

set -euo pipefail

# Carrega configuração de cores geradas pelo Matugen
COLORS_FILE="$HOME/.local/bin/colors.conf"
if [ -f "$COLORS_FILE" ]; then
  source "$COLORS_FILE"
else
  echo $COLORS_FILE
  echo "⚠️ Arquivo colors.conf não encontrado.  Execute 'matugen generate' primeiro."
  exit 1
fi

# Verifica se gum está disponível
HAS_GUM=false
if command -v gum &>/dev/null; then
  HAS_GUM=true
fi

# DEFAULT MESSAGES
EXIT_MESSAGE="➡️ PRESSIONE ENTER PARA SAIR..."
WITHOUT_UPDATES="🔵 NENHUMA ATUALIZAÇÃO DISPONÍVEL"

# Funções auxiliares com suporte a Gum e Material You colors
print_info() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --foreground $HEX_OUTLINE \
      --border none \
      --align left \
      ":: $1"
  else
    echo -e "${COLOR_BLUE}:: ${COLOR_NC} $1"
  fi
}

print_success() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      "$1 ✅️"
  else
    echo -e "${COLOR_GREEN}:: ${COLOR_NC} $1"
  fi
}

print_error() {
  if [ "$HAS_GUM" = true ]; then
    gum style --foreground "$ERROR_COLOR" --bold "❌️ $1"
  else
    echo -e "${COLOR_RED}::${COLOR_NC} $1"
  fi
}

print_warning() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --foreground "$WARNING_COLOR" \
      --border-foreground "$WARNING_COLOR" \
      "⚠️ $1"
  else
    echo -e "${COLOR_YELLOW}::${COLOR_NC} $1"
  fi
}

print_header() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --border double \
      --margin "0 0" \
      "$1"
  else
    echo -e "\n${COLOR_BLUE}=== $1 ===${COLOR_NC}"
  fi
}

print_package_list() {
  local title="$1"
  local content="$2"

  if [ "$HAS_GUM" = true ]; then
    print_header "$title"
    echo "$content" | gum style \
      --foreground $HEX_OUTLINE \
      --align left \
      --border none
  else
    echo -e "\n${COLOR_BLUE}=== $title ===${COLOR_NC}"
    echo "$content"
  fi
}

print_no_updates() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --width 50 \
      $WITHOUT_UPDATES
  else
    echo $WITHOUT_UPDATES
  fi
}

list_outdated_packages() {
  local has_updates=false

  # Lista atualizações oficiais
  if command -v checkupdates &>/dev/null; then
    local official=$(checkupdates 2>/dev/null)
    if [ -n "$official" ]; then
      print_package_list "REPOSITÓRIOS OFICIAIS" "$official"
      has_updates=true
    fi
  else
    local official=$(pacman -Qu 2>/dev/null)
    if [ -n "$official" ]; then
      print_package_list "REPOSITÓRIOS OFICIAIS" "$official"
      has_updates=true
    fi
  fi

  # Lista atualizações do AUR
  if command -v yay &>/dev/null; then
    local aur=$(yay -Qua 2>/dev/null)
    if [ -n "$aur" ]; then
      print_package_list "AUR" "$aur"
      has_updates=true
    fi
  fi

  if [ "$has_updates" = false ]; then
    print_no_updates
  fi
}

perform_update() {
  local exit_code=0

  if [ "$HAS_GUM" = true ]; then
    if command -v yay &>/dev/null; then
      yay -Syu --noconfirm
      exit_code=$?
    else
      sudo pacman -Syu --noconfirm
      exit_code=$?
    fi
  fi

  if [ $exit_code -ne 0 ]; then
    print_error "Falha durante a atualização dos pacotes."
    return $exit_code
  fi

  return 0
}

main() {
  print_header "ATUALIZAÇÃO DO SISTEMA 🔄"

  local check_script="$HOME/.local/bin/check-updates.sh"
  local updates

  if [ -f "$check_script" ]; then
    if [ "$HAS_GUM" = true ]; then
      updates=$(gum spin \
        --title "Verificando..." \
        -- "$check_script")
    else
      updates=$("$check_script")
    fi
  else
    # Fallback:  conta manualmente
    local official=0
    local aur=0

    if command -v checkupdates &>/dev/null; then
      official=$(checkupdates 2>/dev/null | wc -l)
    else
      official=$(pacman -Qu 2>/dev/null | wc -l)
    fi

    if command -v yay &>/dev/null; then
      aur=$(yay -Qua 2>/dev/null | wc -l)
    fi

    updates=$((official + aur))
  fi

  if [ "$updates" -gt 0 ]; then

    if [ "$HAS_GUM" = true ]; then
      print_success "$updates ATUALIZAÇÕES DISPONÍVEIS"
      gum spin --title "Carregando pacotes desatualizados" -- sleep 2
    fi

    list_outdated_packages

    if [ "$HAS_GUM" = true ]; then
      if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA? "; then
        echo
        perform_update
        local update_result=$?

        if [ $update_result -ne 0 ]; then
          print_error "$EXIT_MESSAGE"
          read -r
          exit 1
        fi
      else
        print_warning "ATUALIZAÇÃO CANCELADA"
        gum style "$EXIT_MESSAGE"
        read -r
        exit 0
      fi
    else
      read -rp "deseja iniciar a atualização agora? (s/n): " -n 1 confirm
      echo
      if [[ "$confirm" =~ ^[ssyy]$ ]]; then
        echo
        perform_update
        local update_result=$?

        if [ $update_result -ne 0 ]; then
          echo
          read -rp "$EXIT_MESSAGE"
          exit 1
        fi
      else
        echo
        print_warning "atualização cancelada."
        echo
        read -rp "$EXIT_MESSAGE"
        exit 0
      fi
    fi

    echo
    print_success "ATUALIZAÇÃO CONCLUÍDA COM SUCESSO!"
    if [ "$HAS_GUM" = true ]; then
      gum style "$EXIT_MESSAGE"
      read -r
    fi

  else
    print_no_updates
    if [ "$HAS_GUM" = true ]; then
      gum style "$EXIT_MESSAGE"
      read -r
    fi
  fi
}

main
