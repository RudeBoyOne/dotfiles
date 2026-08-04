# Keybindings

Keyboard and mouse bindings configuration for Hyprland, using the Lua `hl.bind()` API.

## File Location

`.config/hypr/components/binds.lua`

## Modifier Keys

| Variable | Key |
|----------|-----|
| `mainMod` | SUPER (Windows/Command key) |
| `secondMod` | ALT |
| `thirdMod` | SHIFT |

## Binding Syntax

```lua
-- Execute a command
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(programs.terminal))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Focus navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
```

## Options

| Option | Type | Description |
|--------|------|-------------|
| `{ mouse = true }` | boolean | Mouse binding |
| `{ repeating = true }` | boolean | Repeats while held |
| `{ locked = true }` | boolean | Works even when locked |

## Current Bindings

### Session Management

| Binding | Action |
|---------|--------|
| `mainMod + SHIFT + Q` | Exit menu (`programs.menu_exit`) |
| `mainMod + L` | Lock screen (`programs.locker`) |
| `ALT + SHIFT + W` | Wallpaper picker (`programs.wallpaperPicker`) |
| `ALT + CTRL + U` | Terminal with update script |
| `ALT + CTRL + W` | Statusbar toggle (`programs.statusbar`) |

### Programs

| Binding | Action |
|---------|--------|
| `mainMod + Return` | Terminal |
| `mainMod + D` | File manager |
| `mainMod + B` | Browser |
| `mainMod + E` | Email |
| `mainMod + I` | Emoji picker |
| `mainMod + SUPER_L` | Launcher menu (`programs.menu`) |
| `mainMod + SHIFT + D` | Discord |
| `mainMod + ALT + S` | Music |
| `ALT + T` | Telegram (workspace 10) |

### Notifications

| Binding | Action |
|---------|--------|
| `mainMod + N` | Notifications history |
| `mainMod + SHIFT + N` | Silent notifications (DND) |
| `mainMod + ALT + N` | Clean notifications |

### Screenshot

| Binding | Action |
|---------|--------|
| `mainMod + SHIFT + S` | Screenshot (region, save) |
| `mainMod + PRINT` | Screenshot (region, save) |
| `mainMod + ALT + W` | Screenshot (window, save) |
| `mainMod + ALT + M` | Screenshot (monitor, save) |

### Clipboard & Color Picker

| Binding | Action |
|---------|--------|
| `mainMod + V` | Clipboard manager (area transfer) |
| `mainMod + SHIFT + V` | Clean clipboard |
| `mainMod + SHIFT + C` | Color picker |

### Window Management

| Binding | Action |
|---------|--------|
| `mainMod + Q` | Close active window |
| `mainMod + F` | Toggle floating |
| `ALT + F` | Fullscreen |
| `mainMod + M` | Maximize window |
| `mainMod + ,` | Config manager |
| `mainMod + C` | Control center |

### Focus Navigation

| Binding | Action |
|---------|--------|
| `mainMod + Left` | Move focus left |
| `mainMod + Right` | Move focus right |
| `mainMod + Up` | Move focus up |
| `mainMod + Down` | Move focus down |

### Window Swapping

| Binding | Action |
|---------|--------|
| `mainMod + ALT + Left` | Swap window left |
| `mainMod + ALT + Right` | Swap window right |
| `mainMod + ALT + Up` | Swap window up |
| `mainMod + ALT + Down` | Swap window down |

### Window Resizing

| Binding | Action |
|---------|--------|
| `mainMod + SHIFT + Right` | Resize +50 horizontal |
| `mainMod + SHIFT + Left` | Resize -50 horizontal |
| `mainMod + SHIFT + Down` | Resize +50 vertical |
| `mainMod + SHIFT + Up` | Resize -50 vertical |

### Mouse Bindings

| Binding | Action |
|---------|--------|
| `mainMod + Mouse:272 (LMB)` | Move window (drag) |
| `mainMod + Mouse:273 (RMB)` | Resize window |

### Workspaces

Workspaces 1-9 are bound in a loop:

```lua
for i = 1, 9 do
    local key = tostring(i)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = key }))
    hl.bind(mainMod .. " + " .. thirdMod .. " + " .. key,
        hl.dsp.window.move({ workspace = key, follow = true }))
end

-- Workspace 10 (mapped to 0)
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + " .. thirdMod .. " + 0",
    hl.dsp.window.move({ workspace = "10", follow = true }))

-- Cycle workspaces with Tab
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + " .. thirdMod .. " + Tab", hl.dsp.focus({ workspace = "m-1" }))
```

| Binding | Action |
|---------|--------|
| `mainMod + 1-9` | Switch to workspace 1-9 |
| `mainMod + SHIFT + 1-9` | Move window to workspace (follow) |
| `mainMod + 0` | Switch to workspace 10 |
| `mainMod + SHIFT + 0` | Move window to workspace 10 |
| `mainMod + Tab` | Next workspace |
| `mainMod + SHIFT + Tab` | Previous workspace |

### Media Keys

| Binding | Action |
|---------|--------|
| `XF86AudioRaiseVolume` | Volume increase (repeating) |
| `XF86AudioLowerVolume` | Volume decrease (repeating) |
| `XF86AudioMute` | Volume mute |
| `mainMod + SHIFT + M` | Toggle microphone |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |

## Adding New Bindings

1. Add application to `programs.lua` if needed
2. Add binding to `binds.lua`:

```lua
-- Simple command
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(programs.myapp))

-- With options
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
```

## References

- [Hyprland Binding Docs](https://wiki.hyprland.org/Configuring/Binds/)
