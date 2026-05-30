# Dotfiles Documentation

This directory contains detailed documentation for all components of this Hyprland-based dotfiles configuration.

## Overview

This dotfiles repository manages a Wayland desktop environment with:
- **Hyprland** - Compositor Wayland
- **UWSM** - Session manager com systemd
- **Noctalia** - Desktop shell (launcher, bar, notifications)
- **tuigreet** - Display manager
- **GTK/Qt theming** - Visual consistency

## Directory Structure

| Directory | Description |
|-----------|-------------|
| [hyprland/](hyprland/) | Hyprland compositor configuration |
| [tuigreet/](tuigreet/) | Display manager setup |
| [shell/](shell/) | Zsh shell configuration |
| [theming/](theming/) | GTK, Qt, Kitty theming |
| [scripts/](scripts/) | User scripts |

## Quick Links

### Hyprland
- [Hyprland Overview](hyprland/README.md)
- [UWSM Session Management](hyprland/uwsm.md)
- [Applications](hyprland/apps.md)
- [Keybindings](hyprland/binds.md)
- [Window Rules](hyprland/rules.md)

### Other Components
- [tuigreet Display Manager](tuigreet/README.md)
- [Zsh Shell Configuration](shell/README.md)
- [Theming](theming/README.md)
- [Scripts](scripts/README.md)

## Quick Commands

```bash
# Reload Hyprland config
hyprctl reload

# Check for errors
journalctl --user -u hyprland -f
```

## Related Files

Main configuration: `.config/hypr/`
Shell configuration: `.zshrc`
Display manager: `tuigreet/`
