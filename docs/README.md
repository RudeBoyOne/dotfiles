# Dotfiles Documentation

This directory contains detailed documentation for all components of this Hyprland-based dotfiles configuration.

## Overview

This dotfiles repository manages a Wayland desktop environment with:
- **Hyprland** - Lua-based Wayland compositor
- **UWSM** - Systemd-based session manager
- **Noctalia** - Desktop shell (launcher, bar, notifications)
- **tuigreet** - Display manager
- **Zsh** - Modular shell with Zinit
- **Starship** - Cross-shell prompt
- **GTK/Qt theming** - Visual consistency

## Directory Structure

| Directory | Description |
|-----------|-------------|
| [hyprland/](hyprland/) | Hyprland Lua configuration |
| [tuigreet/](tuigreet/) | Display manager setup |
| [shell/](shell/) | Zsh shell configuration |
| [theming/](theming/) | GTK, Qt, Kitty, Starship theming |
| [scripts/](scripts/) | User scripts and automation |

## Quick Links

### Hyprland
- [Hyprland Overview](hyprland/README.md) - Lua config structure, hl.* API
- [UWSM Session Management](hyprland/uwsm.md) - Systemd session management
- [Applications](hyprland/apps.md) - programs.lua, Noctalia IPC
- [Keybindings](hyprland/binds.md) - hl.bind() API, dispatchers
- [Window Rules](hyprland/rules.md) - hl.window_rule(), hl.layer_rule()

### Other Components
- [tuigreet Display Manager](tuigreet/README.md)
- [Zsh Shell Configuration](shell/README.md) - Modular config, Zinit, Starship
- [Theming](theming/README.md) - GTK, Qt, Kitty, Starship
- [Scripts](scripts/README.md) - User scripts, colors, updates

## Quick Commands

```bash
# Reload Hyprland config
hyprctl reload

# Check for errors
journalctl --user -u hyprland -f

# Check active slices
systemctl --user list-units --type=slice

# Zsh module development
source ~/.config/zsh/.zshrc
```

## Related Files

Main configuration: `.config/hypr/`
Shell configuration: `.config/zsh/`
Display manager: `tuigreet/`
User scripts: `.local/bin/`
