# Theming

Visual theme configuration for GTK, Qt, Kitty, and Hyprland.

## Overview

This dotfiles uses Noctalia color scheme across all applications for visual consistency.

## Theme Files

### GTK

```
.config/gtk-3.0/
├── settings.ini     # GTK3 settings
├── colors.css      # Color overrides
├── noctalia.css    # Noctalia theme
└── bookmarks       # File manager bookmarks

.config/gtk-4.0/
├── settings.ini     # GTK4 settings
├── colors.css      # Color overrides
├── gtk.css        # GTK4 styles
└── noctalia.css   # Noctalia theme
```

### Qt6

```
.config/qt6ct/
├── qt6ct.conf      # Qt6 configuration
└── colors/
    └── noctalia.conf  # Noctalia colors
```

### Kitty

```
.config/kitty/
├── kitty.conf         # Main config
├── current-theme.conf # Current theme
└── themes/
    └── noctalia.conf  # Noctalia theme
```

### Hyprland

```
.config/hypr/
└── noctalia/
    └── noctalia-colors.conf  # Colors for Hyprland
```

## Color Scheme

The theme uses Noctalia color palette - a dark theme with purple/blue accents.

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

## References

- [Noctalia](https://docs.noctalia.dev/)
- [GTK Theming](https://wiki.archlinux.org/title/GTK)
- [Qt Theming](https://wiki.archlinux.org/title/Qt)
