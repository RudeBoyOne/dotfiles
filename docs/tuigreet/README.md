# tuigreet Display Manager

tuigreet is a minimal display manager that starts the Hyprland session using UWSM.

## Overview

tuigreet provides a lightweight login screen and launches Hyprland through UWSM for proper systemd session management.

## Files

```
tuigreet/
├── config.toml              # tuigreet configuration
├── hyprland-uwsm-quiet     # Script to start Hyprland via UWSM
└── hyprland-uwsm-quiet.desktop  # Desktop entry for display manager
```

## Configuration

### config.toml

```toml
[terminal]
vt = 1

[default_session]
command = "tuigreet --cmd hyprland --time --time-format '%d/%m/%Y - %H:%M' --remember --remember-session --asterisks --container-padding 2 --width 70 --sessions /usr/share/wayland-sessions --power-shutdown 'systemctl poweroff' --power-reboot 'systemctl reboot'"

user = "greeter"
```

### hyprland-uwsm-quiet

```sh
#!/bin/sh
exec uwsm start -- hyprland.desktop > /dev/null 2>&1
```

This script:
1. Starts UWSM
2. Launches Hyprland via the desktop entry
3. Suppresses output for a clean experience

## How It Works

1. tuigreet presents the login screen
2. After authentication, it runs `hyprland-uwsm-quiet`
3. The script starts UWSM with the Hyprland desktop entry
4. UWSM manages the session and launches applications

## Installation

The desktop entry should be copied to `/usr/share/wayland-sessions/`:

```bash
sudo cp tuigreet/hyprland-uwsm-quiet.desktop /usr/share/wayland-sessions/
```

## References

- [tuigreet GitHub](https://github.com/Aire-One/tuigreet)
- [UWSM Documentation](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)
