# Modo emacs (atalhos padrão)
bindkey -e

# Navegação no histórico
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Início/Fim da linha
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Deletar caracteres
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word

# Navegação por palavras
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
