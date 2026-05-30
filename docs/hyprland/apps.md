# Applications Configuration

This document describes how applications are launched in this dotfiles.

## programs.conf - App Definitions

Defines variables for applications used throughout the configuration. Located at `.config/hypr/components/programs.conf`.

### Applications using uwsm-app

| Variable | Command | Slice |
|----------|---------|-------|
| `$terminal` | `uwsm-app -- kitty` | app |
| `$fileManager` | `uwsm-app -- nautilus` | app |
| `$browser` | `uwsm-app -- zen-browser` | app |
| `$email` | `uwsm-app -- thunderbird` | app |
| `$telegram` | `uwsm-app -- Telegram` | app |
| `$discord` | `uwsm-app -s b -- vesktop` | background |
| `$music` | `uwsm-app -s b -- spotify-launcher` | background |
| `$color_picker` | `uwsm-app -- hyprpicker --autocopy` | app |
| `$screen_shot_not_save` | `uwsm-app -- hyprshot -z -m region --clipboard-only` | app |
| `$screen_shot_save` | `uwsm-app -- hyprshot -m region -o ~/Pictures/screenshots` | app |
| `$screen_shot_save_window` | `uwsm-app -- hyprshot -m window -active -o ~/Pictures/screenshots` | app |
| `$screen_shot_save_minitor` | `uwsm-app -- hyprshot -m output -m DP-1 -o ~/Pictures/screenshots` | app |

### Applications using Noctalia IPC

These use `qs -c noctalia-shell ipc call` for system functions:

| Variable | Command |
|----------|---------|
| `$menu` | `$ipc launcher toggle` |
| `$locker` | `$ipc lockScreen lock` |
| `$statusbar` | `$ipc bar toggle` |
| `$notifications` | `$ipc notifications toggleHistory` |
| `$silent_notifications` | `$ipc notifications toggleDND` |
| `$config_manager` | `$ipc settings toggle` |
| `$control_center` | `$ipc controlCenter toggle` |
| `$wallpaperPicker` | `$ipc wallpaper random` |
| `$menu_exit` | `$ipc sessionMenu toggle` |
| `$area_transf` | `$ipc plugin:clipper toggle` |
| `$emoji` | `$ipc launcher emoji` |
| `$volume_increase` | `$ipc volume increase` |
| `$volume_decrease` | `$ipc volume decrease` |
| `$volume_mute` | `$ipc volume muteOutput` |

## launch.conf - Session Startup

Apps and services launched at session start. Located at `.config/hypr/components/startup/launch.conf`.

### Current Startup Configuration

| Command | Method | Reason |
|---------|--------|--------|
| `uwsm-app -s s -- udiskie` | uwsm-app | Session slice for daemon |
| `hyprctl setcursor Bibata-Modern-Ice 18` | exec-once | Hyprland command |
| `uwsm-app -s s -- wl-clip-persist --clipboard regular` | uwsm-app | Session slice for daemon |
| `~/.config/hypr/scripts/xdg-desktop-portal-hyprland.sh` | exec-once | Script needs timing (sleep) |
| `qs -c noctalia-shell --no-duplicate` | exec-once | Noctalia autostart (recommended) |
| `uwsm-app -s a -- /usr/lib/nordtray/nordtray` | uwsm-app | App slice for tray |
| `gnome-keyring-daemon --start --components=secrets` | exec-once | Manual (needs study) |
| `dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP` | exec-once | Environment config |
| `systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME` | exec-once | Environment config |

### Systemd Services Enabled

Some apps use native systemd services instead of uwsm-app:

| Service | Status | App |
|---------|--------|-----|
| `cliphist.service` | enabled | Clipboard history |
| `gnome-keyring-daemon.service` | enabled | Keyring |
| `xdg-desktop-portal-hyprland.service` | static | Desktop portal |

## Adding New Applications

### For graphical applications:
1. Add to `programs.conf`: `$appname = uwsm-app -- command`
2. Use in `binds.conf`: `bind = $mod, key, exec, $appname`

### For daemons:
1. Check if service exists: `systemctl --user list-unit-files | grep appname`
2. If exists: Enable with `systemctl --user enable --now appname.service`
3. If not: Add to `launch.conf`: `exec-once = uwsm-app -s s -- appname`

## References

- [Hyprland Keywords](https://wiki.hyprland.org/Configuring/Keywords/)
- [Noctalia Docs](https://docs.noctalia.dev/)
