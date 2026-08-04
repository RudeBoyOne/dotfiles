# Shell Configuration

Modular Zsh configuration with Zinit plugin manager and Starship prompt.

## File Structure

```
.config/zsh/
├── .zshrc              # Main entry point
└── modules/
    ├── aliases.zsh     # Command aliases
    ├── bindings.zsh    # Emacs-mode keybindings
    ├── completions.zsh # Completion styling + fzf-tab
    ├── exports.zsh     # PATH additions
    ├── history.zsh     # History options
    ├── integrations.zsh # Tool integrations (fzf, mise, zoxide, direnv)
    ├── plugins.zsh     # Zinit plugin definitions
    └── prompt.zsh      # Placeholder (fastfetch moved to .zshrc)
```

## Architecture

### .zshenv (Repo Root)

Sets `ZDOTDIR` to enable the modular structure:

```bash
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
```

### .zshrc Entry Point

Minimal entry point that clones Zinit, runs fastfetch, and auto-sources modules:

```bash
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Fastfetch on first shell open
if [ "$SHLVL" -eq 1 ]; then
    fastfetch
fi

# Auto-source all modules
for module in "$ZDOTDIR/modules/"*.zsh; do
    source "$module"
done
```

## Plugin Manager (Zinit)

### Loaded Plugins

| Plugin | Description |
|--------|-------------|
| `starship/starship` | Cross-shell prompt (loaded from gh-r) |
| `zsh-users/zsh-completions` | Extra completions |
| `zsh-users/zsh-autosuggestions` | Fish-like suggestions |
| `zsh-users/zsh-history-substring-search` | History search with arrow keys |
| `Aloxaf/fzf-tab` | fzf-powered tab completion |
| `zsh-users/zsh-syntax-highlighting` | Syntax coloring |

### Oh My Zsh Snippets

| Snippet | Description |
|---------|-------------|
| `OMZL::git.zsh` | Git functions |
| `OMZL::history.zsh` | History configuration |
| `OMZP::git` | Git aliases |
| `OMZP::sudo` | Sudo with ESC |
| `OMZP::archlinux` | Arch Linux completions |
| `OMZP::command-not-found` | Command not found handler |

### Plugin Configuration

```lua
-- Starship (from gh-r)
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

-- Autosuggestions
zinit ice lucid
zinit light zsh-users/zsh-autosuggestions

-- History substring search with keybindings
zinit ice wait lucid atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down"
zinit light zsh-users/zsh-history-substring-search
```

## Modules

### aliases.zsh

```bash
alias ff='fastfetch'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias i='yay -S'
alias r='yay -Rns'
alias s='yay -Ss'
alias info='yay -Si'
alias cat='bat'
alias op='opencode'
```

### bindings.zsh

Emacs-mode keybindings:

| Binding | Action |
|---------|--------|
| `Ctrl+P` | History search backward |
| `Ctrl+N` | History search forward |
| `Home` | Beginning of line |
| `End` | End of line |
| `Delete` | Delete character |
| `Ctrl+H` | Backward kill word |
| `Ctrl+Arrow` | Forward/backward word |

### completions.zsh

- Case-insensitive completion
- Colors via LS_COLORS
- fzf-tab integration with eza preview

### exports.zsh

```bash
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
```

### history.zsh

```bash
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
```

### integrations.zsh

```bash
eval "$(fzf --zsh)"
eval "$(mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
```

| Tool | Description |
|------|-------------|
| `fzf` | Fuzzy finder |
| `mise` | Dev tool manager (formerly rtx) |
| `zoxide` | Smart cd replacement |
| `direnv` | Directory-based environment variables |

## Shell Integrations

| Tool | Description |
|------|-------------|
| `eza` | Modern ls replacement |
| `bat` | Cat replacement with syntax highlighting |
| `fzf` | Fuzzy finder |
| `zoxide` | Smart cd |
| `mise` | Dev tool manager |
| `direnv` | Directory env |
| `starship` | Prompt |

## References

- [Zinit Wiki](https://github.com/zdharma-continuum/zinit)
- [Starship Prompt](https://starship.rs/)
- [fzf](https://github.com/junegunn/fzf)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [eza](https://github.com/eza-community/eza)
