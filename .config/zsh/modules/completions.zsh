# Completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colors via LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Formato das descrições
zstyle ':completion:*:descriptions' format '[%d]'

# Sem menu de completion (fzf-tab captura o prefixo)
zstyle ':completion:*' menu no

# Preview de diretórios com eza no fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Configurações do fzf-tab
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
