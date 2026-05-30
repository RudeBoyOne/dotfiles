# Keybindings

Keyboard and mouse bindings configuration for Hyprland.

## File Location

`.config/hypr/components/binds.conf`

## Modifier Keys

| Variable | Key |
|----------|-----|
| `$mainMod` | SUPER (Windows/Command key) |
| `$secondMod` | ALT |
| `$thirdMod` | SHIFT |

## Binding Syntax

```conf
bind = $mod, <key>, <action>, <args>
binde = $mod SHIFT, <key>, <action>, <args>  # Emulate bind (with shift)
bindl = $mod, <key>, <action>                   # Layer binding
bindm = $mod, mouse:272, movewindow             # Mouse bind
```

## Current Bindings

### Session Management

| Binding | Action |
|---------|--------|
| `$mainMod + $thirdMod + Q` | Exit menu |
| `$mainMod + L` | Lock screen |
| `$secondMod + $thirdMod + W` | Wallpaper picker |
| `$secondMod + CTRL + U` | Terminal (updated) |
| `$secondMod + CTRL + W` | Statusbar |

### Programs

| Binding | Action |
|---------|--------|
| `$mainMod + Return` | Terminal |
| `$mainMod + D` | File manager |
| `$mainMod + B` | Browser |
| `$mainMod + E` | Email |
| `$mainMod + I` | Emoji picker |
| `$secondMod + Space` | Launcher menu |
| `$mainMod + $thirdMod + D` | Discord |
| `$mainMod + $secondMod + S` | Music |

### Notifications

| Binding | Action |
|---------|--------|
| `$mainMod + N` | Notifications |
| `$mainMod + $thirdMod + N` | Silent notifications (DND) |

### Screenshot

| Binding | Action |
|---------|--------|
| `$mainMod + $thirdMod + S` | Screenshot (region, clipboard only) |
| `$mainMod + Print` | Screenshot (region, save) |
| `$mainMod + $secondMod + W` | Screenshot (window, save) |
| `$mainMod + $secondMod + M` | Screenshot (monitor, save) |

### Clipboard

| Binding | Action |
|---------|--------|
| `$mainMod + V` | Clipboard manager (area transfer) |
| `$mainMod + $thirdMod + V` | Clean clipboard |

### Color Picker

| Binding | Action |
|---------|--------|
| `$mainMod + $thirdMod + C` | Color picker |

### Window Management

| Binding | Action |
|---------|--------|
| `$mainMod + Q` | Close active window |
| `$mainMod + F` | Toggle floating |
| `$secondMod + F` | Fullscreen |
| `$mainMod + M` | Maximize window |

### Focus Navigation

| Binding | Action |
|---------|--------|
| `$mainMod + Left` | Move focus left |
| `$mainMod + Right` | Move focus right |
| `$mainMod + Up` | Move focus up |
| `$mainMod + Down` | Move focus down |

### Window Swapping

| Binding | Action |
|---------|--------|
| `$mainMod + $secondMod + Left` | Swap window left |
| `$mainMod + $secondMod + Right` | Swap window right |
| `$mainMod + $secondMod + Up` | Swap window up |
| `$mainMod + $secondMod + Down` | Swap window down |

### Window Resizing

| Binding | Action |
|---------|--------|
| `$mainMod + $thirdMod + Right` | Resize +50 horizontal |
| `$mainMod + $thirdMod + Left` | Resize -50 horizontal |
| `$mainMod + $thirdMod + Down` | Resize +50 vertical |
| `$mainMod + $thirdMod + Up` | Resize -50 vertical |

### Mouse Bindings

| Binding | Action |
|---------|--------|
| `$mainMod + Mouse Drag Left` | Move window |
| `$mainMod + Mouse Drag Right` | Resize window |

### Workspaces

| Binding | Action |
|---------|--------|
| `$mainMod + 1-0` | Switch to workspace 1-10 |
| `$mainMod + $thirdMod + 1-0` | Move window to workspace |
| `$mainMod + Tab` | Next workspace |
| `$mainMod + $thirdMod + Tab` | Previous workspace |

### Media Keys

| Binding | Action |
|---------|--------|
| `XF86AudioRaiseVolume` | Volume increase |
| `XF86AudioLowerVolume` | Volume decrease |
| `XF86AudioMute` | Volume mute |
| `$mainMod + $thirdMod + M` | Toggle microphone |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |

## Adding New Bindings

1. Add application variable to `programs.conf` if needed
2. Add binding to `binds.conf` following the syntax

Example:
```conf
bind = $mainMod, P, exec, $myapp
```

## References

- [Hyprland Binding Docs](https://wiki.hyprland.org/Configuring/Binds/)
