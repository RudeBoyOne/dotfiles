#!/bin/bash
# Script de atualização do sistema com cores Material You
# Cores geradas dinamicamente pelo Matugen

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

# Funções auxiliares com suporte a Gum e Material You colors
print_info() {
  if [ "$HAS_GUM" = true ]; then
    gum style --foreground "$UPDATE_INFO_COLOR" --bold "::  $1"
  else
    echo -e "${COLOR_BLUE}:: ${COLOR_NC} $1"
  fi
}

print_success() {
  if [ "$HAS_GUM" = true ]; then
    gum style --foreground "$UPDATE_SUCCESS_COLOR" --bold "✓ $1"
  else
    echo -e "${COLOR_GREEN}:: ${COLOR_NC} $1"
  fi
}

print_error() {
  if [ "$HAS_GUM" = true ]; then
    gum style --foreground "$UPDATE_ERROR_COLOR" --bold "✗ $1"
  else
    echo -e "${COLOR_RED}::${COLOR_NC} $1"
  fi
}

print_warning() {
  if [ "$HAS_GUM" = true ]; then
    gum style --foreground "$UPDATE_WARNING_COLOR" --bold "⚠ $1"
  else
    echo -e "${COLOR_YELLOW}::${COLOR_NC} $1"
  fi
}

print_header() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --foreground "$UPDATE_HEADER_COLOR" \
      --border double \
      --border-foreground "$UPDATE_BORDER_COLOR" \
      --padding "0 2" \
      --margin "1 0" \
      --bold \
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
    echo "$content" | gum style --foreground "$HEX_ON_SURFACE" --padding "0 2"
  else
    echo -e "\n${COLOR_BLUE}=== $title ===${COLOR_NC}"
    echo "$content"
  fi
}

print_banner() {
  if [ "$HAS_GUM" = true ]; then
    gum style \
      --foreground "$HEX_PRIMARY" \
      --border rounded \
      --border-foreground "$HEX_PRIMARY_CONTAINER" \
      --align center \
      --width 50 \
      --margin "1 0" \
      --padding "1 2" \
      --bold \
      "$@"
  fi
}

# Lista pacotes desatualizados
list_outdated_packages() {
  local has_updates=false

  # Lista atualizações oficiais
  if command -v checkupdates &>/dev/null; then
    local official=$(checkupdates 2>/dev/null)
    if [ -n "$official" ]; then
      print_package_list "Repositórios Oficiais" "$official"
      has_updates=true
    fi
  else
    local official=$(pacman -Qu 2>/dev/null)
    if [ -n "$official" ]; then
      print_package_list "Repositórios Oficiais" "$official"
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
    print_info "Nenhuma atualização disponível."
  fi
}

# Realiza a atualização com spinner
perform_update() {
  print_info "Atualização iniciada."
  echo

  local exit_code=0

  if [ "$HAS_GUM" = true ]; then
    if command -v yay &>/dev/null; then
      yay -Syu --noconfirm
    else
      sudo pacman -Syu --noconfirm
    fi
    exit_code=$?
  fi

  if [ $exit_code -ne 0 ]; then
    print_error "Falha durante a atualização dos pacotes."
    return $exit_code
  fi

  return 0
}

# Função principal
main() {
  # Banner inicial
  print_banner "Sistema de Atualização" "Arch Linux"
  echo

  print_info "Verificando atualizações disponíveis..."
  echo

  # Chama o script de verificação usado pela Waybar
  local check_script="$HOME/.config/waybar/scripts/check-updates.sh"
  local updates

  if [ -f "$check_script" ]; then
    if [ "$HAS_GUM" = true ]; then
      updates=$(gum spin \
        --spinner dot \
        --title "Verificando..." \
        --title.foreground "$HEX_SECONDARY" \
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
    echo

    # Mostra número de atualizações com estilo
    if [ "$HAS_GUM" = true ]; then
      gum style \
        --foreground "$HEX_ON_TERTIARY" \
        --background "$HEX_TERTIARY_CONTAINER" \
        --padding "0 2" \
        --margin "0 1" \
        --bold \
        " Atualizações disponíveis: $updates "
    else
      print_success "Atualizações disponíveis: $updates"
    fi

    echo
    print_info "Listando pacotes desatualizados:"
    list_outdated_packages
    echo

    # Confirmação usando gum
    if [ "$HAS_GUM" = true ]; then
      gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA? "
      local confirm_result=$?

      if [[ $confirm_result -eq 0 ]]; then
        echo
        perform_update
        local update_result=$?

        if [ $update_result -ne 0 ]; then
          echo
          gum style --foreground "$hex_error" "pressione enter para sair..."
          read -r
          exit 1
        fi
      elif [ $confirm_result -eq 130 ]; then
        exit 130
      else
        echo
        print_warning "atualização cancelada."
        echo
        gum style --foreground "$hex_outline" "pressione enter para sair..."
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
          read -rp "pressione enter para sair..."
          exit 1
        fi
      else
        echo
        print_warning "atualização cancelada."
        echo
        read -rp "pressione enter para sair..."
        exit 0
      fi
    fi

    echo
    print_success "atualização concluída com sucesso!"

  else
    echo
    if [ "$HAS_GUM" = true ]; then
      gum style \
        --foreground "$HEX_ON_SURFACE" \
        --border rounded \
        --border-foreground "$HEX_OUTLINE" \
        --align center \
        --padding "1 2" \
        --margin "1 0" \
        "🔵 NENHUMA ATUALIZAÇÃO DISPONÍVEL"
      echo
      gum style --foreground "$HEX_OUTLINE" "➡️ PRESSIONE ENTER PARA SAIR..."
      read -p ""
    else
      echo "🔵 NENHUMA ATUALIZAÇÃO DISPONÍVEL"
    fi
  fi
}

# executa o script
main
