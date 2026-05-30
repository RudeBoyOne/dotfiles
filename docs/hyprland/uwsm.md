# UWSM Session Management

UWSM (Universal Wayland Session Manager) wraps Hyprland and applications into systemd units for robust session management.

## Why UWSM?

- Runs apps as separate systemd units (not inside compositor's unit)
- Better resource management and cleanup on shutdown
- Apps can be managed individually by systemd
- Allows systemd to kill lower-priority apps first if resources are low
- Enables automatic restart on failure

## Starting Hyprland with UWSM

### From TTY
```bash
uwsm start -- hyprland.desktop
```

### Using Desktop Entry
The repository includes `tuigreet/hyprland-uwsm-quiet`:
```bash
#!/bin/sh
exec uwsm start -- hyprland.desktop > /dev/null 2>&1
```

## Launching Applications with uwsm-app

Applications should be launched using `uwsm-app` (included with uwsm package):

```bash
# Default slice (app-graphical.slice) - for interactive apps
$terminal = uwsm-app -- kitty

# Background slice - for apps that run in background
$discord = uwsm-app -s b -- vesktop

# Session slice - for utilities and daemons
$udiskie = uwsm-app -s s -- udiskie
```

## Slices Reference

| Slice | Flag | Use Case |
|-------|------|----------|
| `app-graphical.slice` | `-s a` (default) | Interactive apps (terminal, browser, file manager) |
| `background-graphical.slice` | `-s b` | Background apps (discord, spotify, vesktop) |
| `session-graphical.slice` | `-s s` | Daemons and utilities (udiskie, wl-clip-persist, nordtray) |

## Current App Configuration

See [apps.md](apps.md) for current application definitions.

## Verify Running Apps

```bash
# Check active slices
systemctl --user list-units --type=slice

# Check running app scopes
systemctl --user list-units --type=scope | grep Hyprland

# Check specific app status
systemctl --user status app-kitty-*.scope
```

## References

- [Hyprland Systemd Startup](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)
- [Arch Wiki - UWSM](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager)
