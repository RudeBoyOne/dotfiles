# Window Rules

Window and workspace rules configuration for Hyprland.

## File Location

Window rules are located in `.config/hypr/components/rules/`:

```
rules/
├── rules.conf         # Main file that sources others
├── window-rule.conf  # Window-specific rules
└── layer-rule.conf   # Layer rules
```

## Window Rules Syntax

```conf
windowrule = <rule>, <class>/<title>
windowrulev2 = <rule>, <class>/<title>
```

## Common Rules

| Rule | Description |
|------|-------------|
| `float on` | Make window floating |
| `size W H` | Set specific size |
| `center on` | Center on screen |
| `no_shadow on` | Disable shadows |
| `decorate off` | Remove decorations |
| `dim_around on` | Dim surrounding |
| `no_focus on` | Don't focus automatically |

## Current Window Rules

### Floating Windows

| Class | Size | Position |
|-------|------|----------|
| `org.gnome.Calculator` | 360x616 | Center |
| `com.saivert.pwvucontrol` | 746x457 | Center |
| `org.gnome.Nautilus` | 996x655 | Center |
| `kitty` | 875x541 | Center |
| `blueberry.py` | 731x495 | Center |
| `org.gnome.FileRoller` | 819x562 | Center |
| `org.gnome.Solanum` | 360x294 | Custom |
| `org.kde.kdeconnect.handler` | Float | - |
| `org.kde.kdeconnect.sms` | Float | - |
| `remote-viewer` | Float | - |
| `Xdg-desktop-portal-gtk` | Float | - |
| `org.kde.kdeconnect-indicator` | Float | - |

### XWayland Rules

```conf
# XWayland focus issues
windowrule = match:xwayland 1, no_initial_focus on, no_blur on

# JetBrains IDE focus
windowrule = match:class ^(.*jetbrains.*)$ match:title title:^\s$, no_focus on
```

### Portal GTK

```conf
windowrule = match:class Xdg-desktop-portal-gtk, no_shadow on, decorate off, dim_around on
windowrule = match:class xdg-desktop-portal-gtk, float on, size 932 670, center on, dim_around on
```

## Adding New Rules

1. Find window class: `xprop | grep CLASS`
2. Add rule to `window-rule.conf`:

```conf
windowrule = match:class WindowClass, float on, size 800 600, center on
```

## References

- [Hyprland Window Rules](https://wiki.hyprland.org/Configuring/Window-Rules/)
