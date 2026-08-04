# AGENTS.md - Dotfiles

## Overview

This is a dotfiles configuration repository for a Wayland-based desktop environment using:
- **Hyprland** - Wayland compositor (Lua-based configuration)
- **UWSM** - Universal Wayland Session Manager
- **Noctalia** - Desktop shell (launcher, bar, notifications, etc.)
- **tuigreet** - Display manager
- **Zsh** - Shell with Zinit plugin manager and modular configuration
- **Starship** - Cross-shell prompt

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
├── .zshenv                  # Sets ZDOTDIR for Zsh
├── .config/
│   ├── hypr/               # Hyprland configuration (Lua)
│   │   ├── hyprland.lua    # Main entry point
│   │   ├── .luarc.json     # LSP config for hl.* API
│   │   ├── hyprtoolkit.conf # Theme colors
│   │   ├── components/     # Modular Lua configs
│   │   │   ├── animations.lua
│   │   │   ├── binds.lua
│   │   │   ├── general.lua
│   │   │   ├── monitors.lua
│   │   │   ├── programs.lua
│   │   │   ├── rules/
│   │   │   └── startup/
│   │   ├── scripts/        # Helper scripts
│   │   └── noctalia/       # Theme colors (gitignored)
│   ├── zsh/                # Zsh configuration
│   │   ├── .zshrc          # Main shell entry point
│   │   └── modules/        # Modular shell configs
│   ├── gtk-3.0/            # GTK3 theming
│   ├── gtk-4.0/            # GTK4 theming
│   ├── kitty/              # Terminal theming
│   ├── qt6ct/              # Qt6 theming
│   └── starship.toml       # Prompt configuration
├── .local/bin/             # User scripts
├── tuigreet/               # Display manager
└── shellscripts/           # Installation scripts
```

---

## Key Concepts

### Hyprland Lua Configuration

Hyprland uses a Lua-based configuration with the `hl.*` API. The main entry point is `hyprland.lua` which loads components via `require()`:

```lua
require("components.startup.startup")
require("components.monitors")
require("components.general")
require("components.animations")
require("components.binds")
require("components.rules.rules")
```

Key API functions:
- `hl.config({...})` - Set configuration values
- `hl.bind(key, handler, opts)` - Register keybindings
- `hl.window_rule({...})` - Define window rules
- `hl.layer_rule({...})` - Define layer rules
- `hl.animation({...})` - Configure animations
- `hl.curve(name, {...})` - Define animation curves
- `hl.env(name, value)` - Set environment variables
- `hl.on(event, callback)` - Register event handlers
- `hl.exec_cmd(command)` - Execute shell commands

See [Hyprland Overview](docs/hyprland/README.md) for details.

### UWSM Session Management

This dotfiles uses UWSM to manage the Hyprland session. Applications are launched as separate systemd units using `uwsm-app`:

```lua
-- Default slice (interactive apps)
programs.terminal = "uwsm-app -- kitty"

-- Background slice
programs.discord = "uwsm-app -s b -- discord"

-- Session slice (daemons)
programs.udiskie = "uwsm-app -s s -- udiskie"
```

See [UWSM Documentation](docs/hyprland/uwsm.md) for details.

### Noctalia IPC

System functions use Noctalia IPC via `qs -c noctalia-shell ipc call`:

```lua
local ipc = "qs -c noctalia-shell ipc call"
programs.menu = "vicinae toggle"
programs.locker = ipc .. " lockScreen lock"
programs.statusbar = ipc .. " bar toggle"
programs.notifications = ipc .. " notifications toggleHistory"
```

### Modular Zsh Configuration

Zsh uses a modular approach with `.zshenv` setting `ZDOTDIR` and `.zshrc` auto-sourcing modules:

```
.config/zsh/
├── .zshrc          # Entry point: Zinit + fastfetch + auto-source
└── modules/
    ├── aliases.zsh
    ├── bindings.zsh
    ├── completions.zsh
    ├── exports.zsh
    ├── history.zsh
    ├── integrations.zsh
    ├── plugins.zsh
    └── prompt.zsh
```

---

## Code Style Guidelines

### Hyprland Config (Lua)

- **Indentation**: 4 spaces (tabs in some files)
- **Variables**: `local varname = value`
- **Tables**: `local table = { key = value }`
- **String concat**: `..` operator
- **Module pattern**: `return module_table`
- **Comments**: `-- single line`, `--[[ multi-line ]]`

### Shell Scripts

- Use `#!/bin/bash` or `#!/bin/sh` shebang
- Quote variables: `"$variable"`
- Use `set -e` or `set -euo pipefail` for error handling
- Use `gum` for styled output when available

---

## Best Practices

1. **Test after changes** - Run `hyprctl reload`
2. **Use uwsm-app** - For launching graphical applications
3. **Use systemd services** - For apps with native units
4. **Keep scripts for timing** - Some need sleep/timing
5. **Use LSP** - Configure `.luarc.json` for `hl.*` API autocomplete

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

# Zsh module development
source ~/.config/zsh/.zshrc
```

---

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Hyprland Lua API](https://wiki.hyprland.org/Configuring/)
- [UWSM Documentation](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)
- [Noctalia Docs](https://docs.noctalia.dev/)
- [Arch Wiki - UWSM](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager)
- [Zinit Wiki](https://github.com/zdharma-continuum/zinit)
- [Starship Prompt](https://starship.rs/)
