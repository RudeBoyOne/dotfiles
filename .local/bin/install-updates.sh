#!/bin/bash

set -euo pipefail

# =============================================================================
# VERIFICAÇÃO DE DEPENDÊNCIAS
# =============================================================================

# Verifica colors.conf (Matugen)
COLORS_FILE="$HOME/.local/bin/colors.conf"
if [ ! -f "$COLORS_FILE" ]; then
  echo "❌ Erro: Arquivo colors.conf não encontrado em $COLORS_FILE"
  echo "   Execute 'matugen generate' primeiro."
  exit 1
fi
source "$COLORS_FILE"

# Verifica gum
if ! command -v gum &>/dev/null; then
  echo "❌ Erro: 'gum' não está instalado."
  echo "   Instale com: yay -S gum"
  exit 1
fi

# Verifica yay
if ! command -v yay &>/dev/null; then
  echo "❌ Erro: 'yay' não está instalado."
  echo "   Instale seguindo: https://github.com/Jguer/yay#installation"
  exit 1
fi

# Verifica check-updates.sh
CHECK_SCRIPT="$HOME/.local/bin/check-updates.sh"
if [ ! -f "$CHECK_SCRIPT" ]; then
  echo "❌ Erro: Script check-updates.sh não encontrado em $CHECK_SCRIPT"
  exit 1
fi

# =============================================================================
# CONFIGURAÇÃO
# =============================================================================

EXIT_MESSAGE="➡️ PRESSIONE ENTER PARA SAIR..."
WITHOUT_UPDATES="🔵 NENHUMA ATUALIZAÇÃO DISPONÍVEL"

# =============================================================================
# FUNÇÕES AUXILIARES
# =============================================================================

print_info() {
  gum style \
    --foreground "$HEX_OUTLINE" \
    --border none \
    --align left \
    ":: $1"
}

print_success() {
  gum style "$1 ✅️"
}

print_error() {
  gum style --foreground "$ERROR_COLOR" --bold "❌️ $1"
}

print_warning() {
  gum style \
    --foreground "$WARNING_COLOR" \
    --border-foreground "$WARNING_COLOR" \
    "⚠️ $1"
}

print_header() {
  gum style \
    --border double \
    --margin "0 0" \
    "$1"
}

print_package_list() {
  local title="$1"
  local content="$2"

  print_header "$title"
  echo "$content" | gum style \
    --foreground "$HEX_OUTLINE" \
    --align left \
    --border none
}

print_no_updates() {
  gum style \
    --width 50 \
    "$WITHOUT_UPDATES"
}

# =============================================================================
# FUNÇÕES PRINCIPAIS
# =============================================================================

list_outdated_packages() {
  local has_updates=false

  # Lista atualizações oficiais
  local official
  official=$(checkupdates 2>/dev/null) || true
  if [ -n "$official" ]; then
    print_package_list "REPOSITÓRIOS OFICIAIS" "$official"
    has_updates=true
  fi

  # Lista atualizações do AUR
  local aur
  aur=$(yay -Qua 2>/dev/null) || true
  if [ -n "$aur" ]; then
    print_package_list "AUR" "$aur"
    has_updates=true
  fi

  if [ "$has_updates" = false ]; then
    print_no_updates
  fi
}

perform_update() {
  local exit_code=0

  yay -Syu --noconfirm
  exit_code=$?

  if [ $exit_code -ne 0 ]; then
    print_error "Falha durante a atualização dos pacotes."
    return $exit_code
  fi

  # Limpa cache mantendo 2 versões de cada pacote
  print_info "Limpando cache de pacotes..."
  paccache -rk2 &>/dev/null || true

  return 0
}

# =============================================================================
# MAIN
# =============================================================================

main() {
  print_header "ATUALIZAÇÃO DO SISTEMA 🔄"

  # Verifica atualizações usando check-updates.sh
  local updates
  updates=$(gum spin --title "Verificando..." -- "$CHECK_SCRIPT")

  # Valida que updates é um número válido
  if ! [[ "$updates" =~ ^[0-9]+$ ]]; then
    print_error "Erro ao verificar atualizações"
    gum style "$EXIT_MESSAGE"
    read -r
    exit 1
  fi

  if [ "$updates" -gt 0 ]; then
    print_success "$updates ATUALIZAÇÕES DISPONÍVEIS"
    gum spin --title "Carregando pacotes desatualizados" -- sleep 2

    list_outdated_packages

    if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA? "; then
      echo
      perform_update
      local update_result=$?

      if [ $update_result -ne 0 ]; then
        print_error "$EXIT_MESSAGE"
        read -r
        exit 1
      fi

      # Sucesso na atualização
      echo
      print_success "ATUALIZAÇÃO CONCLUÍDA COM SUCESSO!"
      gum style "$EXIT_MESSAGE"
      read -r
    else
      # Usuário cancelou
      print_warning "ATUALIZAÇÃO CANCELADA"
      gum style "$EXIT_MESSAGE"
      read -r
      exit 0
    fi
  else
    print_no_updates
    gum style "$EXIT_MESSAGE"
    read -r
  fi
}

main
