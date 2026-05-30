# Hyprland Configuration

This section documents the Hyprland compositor configuration.

## Overview

Hyprland is configured with a modular approach, splitting configuration into logical components.

## Subdirectories

| File | Description |
|------|-------------|
| [uwsm.md](uwsm.md) | UWSM session management |
| [apps.md](apps.md) | Application definitions and startup |
| [binds.md](binds.md) | Keyboard and mouse bindings |
| [rules.md](rules.md) | Window and workspace rules |

## Main Configuration Files

```
.config/hypr/
├── hyprland.conf          # Main entry point
├── hyprlock.conf          # Screen lock
├── hyprtoolkit.conf       # Toolkit config
├── components/
│   ├── general.conf       # General settings
│   ├── binds.conf         # Keybindings
│   ├── monitors.conf      # Monitor config
│   ├── programs.conf      # App definitions
│   ├── startup/           # Startup configs
│   └── rules/             # Window rules
└── scripts/               # Helper scripts
```

## Key Concepts

- **UWSM**: Manages session and launches apps as systemd units
- **Noctalia**: Provides shell functionality via IPC
- **Modular config**: Components sourced from main config

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Configuration Docs](https://wiki.hyprland.org/Configuring/Configuring-Hyprland/)
