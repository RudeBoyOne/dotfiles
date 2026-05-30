# AGENTS.md - Dotfiles

## Overview

This is a dotfiles configuration repository for a Wayland-based desktop environment using:
- **Hyprland** - Wayland compositor
- **UWSM** - Universal Wayland Session Manager
- **Noctalia** - Desktop shell (launcher, bar, notifications, etc.)
- **tuigreet** - Display manager
- **Zsh** - Shell with Zinit plugin manager

## Quick Start

### Reload Hyprland Configuration
```bash
hyprctl reload
```

### Check for Errors
```bash
journalctl --user -u hyprland -f
```

---

## Documentation

Detailed documentation is available in the `docs/` directory:

### Hyprland
- [Hyprland Overview](docs/hyprland/README.md)
- [UWSM Session Management](docs/hyprland/uwsm.md)
- [Applications](docs/hyprland/apps.md)
- [Keybindings](docs/hyprland/binds.md)
- [Window Rules](docs/hyprland/rules.md)

### Other Components
- [Display Manager (tuigreet)](docs/tuigreet/README.md)
- [Shell (.zshrc)](docs/shell/README.md)
- [Theming](docs/theming/README.md)
- [Scripts](docs/scripts/README.md)

---

## Project Structure

```
.
├── AGENTS.md                 # This file
├── README.md                # Basic readme
├── .zshrc                   # Shell configuration
├── .config/
│   ├── hypr/               # Hyprland configuration
│   │   ├── hyprland.conf   # Main entry point
│   │   ├── components/     # Modular configs
│   │   ├── scripts/        # Helper scripts
│   │   └── noctalia/       # Theme colors
│   ├── gtk-3.0/            # GTK3 theming
│   ├── gtk-4.0/            # GTK4 theming
│   ├── kitty/              # Terminal theming
│   └── qt6ct/              # Qt6 theming
├── .local/bin/             # User scripts
├── tuigreet/               # Display manager
└── shellscripts/           # Installation scripts
```

---

## Key Concepts

### UWSM Session Management

This dotfiles uses UWSM to manage the Hyprland session. Applications are launched as separate systemd units using `uwsm-app`.

See [UWSM Documentation](docs/hyprland/uwsm.md) for details.

### Noctalia IPC

System functions (launcher, notifications, volume, etc.) use Noctalia IPC:
- `$menu` = launcher toggle
- `$locker` = lock screen
- `$statusbar` = bar toggle
- etc.

---

## Code Style Guidelines

### Hyprland Config (.conf)

- **Blocks**: Curly braces with 4-space indentation
- **Key-value**: `key = value` (spaces around `=`)
- **Variables**: `$varname = value`
- **Section headers**: `# ------------------- NAME ----------------------`

### Shell Scripts

- Use `#!/bin/bash` shebang
- Quote variables: `"$variable"`
- Use `set -e` for error handling

---

## Best Practices

1. **Test after changes** - Run `hyprctl reload`
2. **Use uwsm-app** - For launching graphical applications
3. **Use systemd services** - For apps with native units
4. **Keep scripts for timing** - Some need sleep/timing

---

## Common Commands

```bash
# Reload Hyprland config
hyprctl reload

# Check active slices
systemctl --user list-units --type=slice

# Check running app scopes
systemctl --user list-units --type=scope | grep Hyprland

# Enable a systemd service
systemctl --user enable --now <service>.service
```

---

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [UWSM Documentation](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)
- [Noctalia Docs](https://docs.noctalia.dev/)
- [Arch Wiki - UWSM](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager)
