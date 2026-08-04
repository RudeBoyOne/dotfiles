# Applications Configuration

Application definitions and startup configuration for Hyprland, using Lua tables and UWSM session management.

## programs.lua - App Definitions

Located at `.config/hypr/components/programs.lua`. Defines all applications and commands as a Lua table.

### Structure

```lua
local programs = {}
local ipc = "qs -c noctalia-shell ipc call"

-- Applications
programs.terminal = "uwsm-app -- kitty"
programs.browser = "uwsm-app -- zen-browser"

-- IPC commands
programs.menu = "vicinae toggle"
programs.locker = ipc .. " lockScreen lock"

return programs
```

### Applications using uwsm-app

| Key | Command | Slice |
|-----|---------|-------|
| `programs.terminal` | `uwsm-app -- kitty` | app (default) |
| `programs.fileManager` | `uwsm-app -- nautilus` | app |
| `programs.browser` | `uwsm-app -- zen-browser` | app |
| `programs.email` | `uwsm-app -- thunderbird` | app |
| `programs.telegram` | `uwsm-app -- Telegram` | app |
| `programs.discord` | `uwsm-app -s b -- discord` | background |
| `programs.music` | `uwsm-app -s b -- spotify-launcher` | background |
| `programs.color_picker` | `uwsm-app -- hyprpicker --autocopy` | app |
| `programs.screen_shot_save` | `uwsm-app -- hyprshot -m region -o ~/Pictures/screenshots` | app |
| `programs.screen_shot_save_window` | `uwsm-app -- hyprshot -m window -active -o ~/Pictures/screenshots` | app |
| `programs.screen_shot_save_minitor` | `uwsm-app -- hyprshot -m output -m DP-1 -o ~/Pictures/screenshots` | app |

### Applications using Noctalia IPC

Uses `qs -c noctalia-shell ipc call` for system UI functions:

| Key | Command |
|-----|---------|
| `programs.menu` | `vicinae toggle` |
| `programs.locker` | `ipc .. " lockScreen lock"` |
| `programs.statusbar` | `ipc .. " bar toggle"` |
| `programs.notifications` | `ipc .. " notifications toggleHistory"` |
| `programs.silent_notifications` | `ipc .. " notifications toggleDND"` |
| `programs.clean_notifications` | `ipc .. " notifications clear"` |
| `programs.config_manager` | `ipc .. " settings toggle"` |
| `programs.control_center` | `ipc .. " controlCenter toggle"` |
| `programs.wallpaperPicker` | `ipc .. " wallpaper random"` |
| `programs.menu_exit` | `ipc .. " sessionMenu toggle"` |
| `programs.emoji` | `ipc .. " launcher emoji"` |
| `programs.area_transf` | `ipc .. " plugin:clipper toggle"` |
| `programs.volume_increase` | `ipc .. " volume increase"` |
| `programs.volume_decrease` | `ipc .. " volume decrease"` |
| `programs.volume_mute` | `ipc .. " volume muteOutput"` |

## launch.lua - Session Startup

Apps and services launched on `hyprland.start` event. Located at `.config/hypr/components/startup/launch.lua`.

### Current Startup Configuration

```lua
hl.on("hyprland.start", function()
    hl.exec_cmd(udiskie)           -- uwsm-app -s s -- udiskie
    hl.exec_cmd(cursor)            -- hyprctl setcursor Bibata-Modern-Ice 18
    hl.exec_cmd(wlClipPersist)     -- uwsm-app -s s -- wl-clip-persist --clipboard regular
    hl.exec_cmd(hyprlandDesktopPortal)  -- xdg-desktop-portal-hyprland.sh
    hl.exec_cmd(noctalia)          -- qs -c noctalia-shell --no-duplicate
    hl.exec_cmd(nordTray)          -- uwsm-app -s a -- /usr/lib/nordtray/nordtray
    hl.exec_cmd(keyringDaemon)     -- gnome-keyring-daemon --start --components=secrets
    hl.exec_cmd(configDbus)        -- dbus-update-activation-environment
    hl.exec_cmd(confiQt)           -- systemctl --user import-environment
    hl.exec_cmd(vicinae)           -- vicinae server
    hl.exec_cmd(plugins)           -- hyprpm reload
end)
```

| Command | Method | Reason |
|---------|--------|--------|
| `uwsm-app -s s -- udiskie` | uwsm-app | Session slice for daemon |
| `hyprctl setcursor Bibata-Modern-Ice 18` | exec_cmd | Set cursor theme |
| `uwsm-app -s s -- wl-clip-persist --clipboard regular` | exec_cmd | Session slice for daemon |
| `qs -c noctalia-shell --no-duplicate` | exec_cmd | Noctalia autostart |
| `uwsm-app -s a -- /usr/lib/nordtray/nordtray` | exec_cmd | App slice for tray |
| `gnome-keyring-daemon --start --components=secrets` | exec_cmd | Keyring daemon |
| `vicinae server` | exec_cmd | Vicinae server |

## Systemd Services

Some apps use native systemd services instead of uwsm-app:

| Service | Status | App |
|---------|--------|-----|
| `cliphist.service` | enabled | Clipboard history |
| `gnome-keyring-daemon.service` | enabled | Keyring |
| `xdg-desktop-portal-hyprland.service` | static | Desktop portal |

## Adding New Applications

### For graphical applications:

1. Add to `programs.lua`:
```lua
programs.myapp = "uwsm-app -- myapp"
```

2. Use in `binds.lua`:
```lua
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(programs.myapp))
```

### For daemons:

1. Check if service exists: `systemctl --user list-unit-files | grep appname`
2. If exists: Enable with `systemctl --user enable --now appname.service`
3. If not: Add to `launch.lua`:
```lua
local mydaemon = "uwsm-app -s s -- mydaemon"
hl.on("hyprland.start", function()
    hl.exec_cmd(mydaemon)
end)
```

## References

- [Hyprland Keywords](https://wiki.hyprland.org/Configuring/Keywords/)
- [Noctalia Docs](https://docs.noctalia.dev/)
- [UWSM Documentation](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)
