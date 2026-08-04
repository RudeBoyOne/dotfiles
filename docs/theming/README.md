# Theming

Visual theme configuration for GTK, Qt, Kitty, Starship, and Hyprland using Noctalia color scheme.

## Overview

This dotfiles uses Noctalia color scheme across all applications for visual consistency. Colors are generated from the current wallpaper and distributed to all theme files.

## Theme Files

### GTK

```
.config/gtk-3.0/
├── settings.ini     # GTK3 settings (adw-gtk3-dark, Colloid icons)
├── gtk.css          # GTK3 CSS overrides
├── noctalia.css     # Noctalia GTK3 colors (gitignored)
├── colors.css       # Generated colors (gitignored)
└── bookmarks        # File manager bookmarks

.config/gtk-4.0/
├── settings.ini     # GTK4 settings
├── gtk.css          # GTK4 CSS overrides
├── noctalia.css     # Noctalia GTK4 colors (gitignored)
└── colors.css       # Generated colors (gitignored)
```

### Qt6

```
.config/qt6ct/
├── qt6ct.conf       # Qt6 configuration (Darkly style, SF fonts)
└── colors/
    └── noctalia.conf # Noctalia Qt6 palette (gitignored)
```

### Kitty

```
.config/kitty/
├── kitty.conf       # Main config (FiraCode, opacity 0.2, cursor trail)
└── themes/
    └── noctalia.conf # Noctalia terminal colors (gitignored)
```

### Starship

`.config/starship.toml` - Cross-shell prompt with Noctalia palette:

```toml
palette = "noctalia"

[palettes.noctalia]
blue    = "#ffffff"
red     = "#ffb4ab"
green   = "#c6c6c6"
yellow  = "#e2e2e2"
cyan    = "#c6c6c6"
magenta = "#c6c6c6"
white   = "#e2e2e2"
black   = "#131313"
# ... extended palette
```

### Hyprland

```
.config/hypr/
├── hyprtoolkit.conf       # Dark theme colors (base, text, accent)
└── noctalia/
    └── noctalia-colors.conf # Noctalia border/group colors (gitignored)
```

`hyprtoolkit.conf` defines the dark palette:

```
background = rgba(131313ff)
base = rgba(131313ff)
text = rgba(e2e2e2ff)
alternate_base = rgba(474747ff)
bright_text = rgba(303030ff)
accent = rgba(ffffffff)
accent_secondary = rgba(c6c6c6ff)
```

## Color Scheme

The theme uses Noctalia color palette - a dark theme with Material You colors generated from the current wallpaper.

## Theme Switching Scripts

### Change GTK/Flatpak Theme
```bash
.local/bin/change-theme-gtk4-and-flatpak.sh
```

### Change Wallpaper Randomly
```bash
.local/bin/change-wallpaper-random.sh
```

## Manual Theme Changes

### GTK3/GTK4
Edit `.config/gtk-3.0/settings.ini` and `.config/gtk-4.0/settings.ini`

### Qt6
Edit `.config/qt6ct/qt6ct.conf`

### Kitty
Set theme in `kitty.conf`:
```
include themes/noctalia.conf
```

### Starship
Edit `.config/starship.toml` and modify the `[palettes.noctalia]` section.

## References

- [Noctalia](https://docs.noctalia.dev/)
- [GTK Theming](https://wiki.archlinux.org/title/GTK)
- [Qt Theming](https://wiki.archlinux.org/title/Qt)
- [Starship Themes](https://starship.rs/presets/)
