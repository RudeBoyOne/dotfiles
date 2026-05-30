# Shell Configuration

Zsh shell configuration with Zinit plugin manager.

## File Location

`.zshrc`

## Overview

The shell is configured with:
- **Zinit** - Plugin manager
- **Powerlevel10k** - Theme
- **Various plugins** - Completions, suggestions, syntax highlighting

## Plugin Manager (Zinit)

```bash
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
```

### Loaded Plugins

| Plugin | Description |
|--------|-------------|
| `romkatv/powerlevel10k` | Theme |
| `zsh-users/zsh-completions` | Completions |
| `zsh-users/zsh-autosuggestions` | Auto suggestions |
| `zsh-users/zsh-history-substring-search` | History search |
| `Aloxaf/fzf-tab` | fzf completion |
| `zsh-users/zsh-syntax-highlighting` | Syntax highlighting |

### Snippets

```bash
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
```

## Keybindings

| Binding | Action |
|---------|--------|
| `Ctrl+P` | History search backward |
| `Ctrl+N` | History search forward |
| `Home` | Beginning of line |
| `End` | End of line |
| `Delete` | Delete character |
| `Ctrl+H` | Backward kill word |
| `Ctrl+Arrow` | Forward/backward word |

## History Configuration

```bash
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups
```

## Aliases

| Alias | Command |
|-------|---------|
| `ff` | `fastfetch` |
| `ls` | `eza -lh --group-directories-first --icons=auto` |
| `lsa` | `ls -a` |
| `lt` | `eza --tree --level=2 --long --icons --git` |
| `hs` | `history \| grep` |
| `i` | `yay -S` |
| `r` | `yay -Rns` |
| `s` | `yay -Ss` |

## Shell Integrations

```bash
eval "$(fzf --zsh)"          # fzf
eval "$(mise activate zsh)" # mise
eval "$(zoxide init --cmd cd zsh)"  # zoxide
```

## PATH Additions

```bash
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:/home/lucas/.local/share/JetBrains/Toolbox/scripts"
```

## Additional Tools

| Tool | Description |
|------|-------------|
| `nvm` | Node Version Manager |
| `sdkman` | SDK Manager |

## References

- [Zinit](https://github.com/zdharma-continuum/zinit)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [fzf](https://github.com/junegunn/fzf)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
