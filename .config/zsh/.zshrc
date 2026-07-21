ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Fastfetch logo ao abrir o terminal
if [ "$SHLVL" -eq 1 ]; then
    fastfetch
fi

# Carregar módulos
for module in "$ZDOTDIR/modules/"*.zsh; do
    source "$module"
done
