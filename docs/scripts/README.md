# Scripts

User scripts and automation tools.

## Overview

This repository contains various scripts for system configuration, theming, and maintenance.

## Scripts Location

### User Scripts

```
.local/bin/
├── check-updates.sh           # Check for system updates
├── change-theme-gtk4-and-flatpak.sh  # Change GTK/Flatpak theme
├── change-wallpaper-random.sh  # Random wallpaper
├── install-updates.sh         # Install system updates
└── weather.sh                 # Weather widget script
```

### Hyprland Scripts

```
.config/hypr/scripts/
├── xdg-desktop-portal-hyprland.sh  # Desktop portal restart
└── clean-area-transf.sh             # Clipboard cleanup
```

### Installation Scripts

```
shellscripts/
└── installPrograms.sh   # Install all required packages
```

## Script Descriptions

### .local/bin/check-updates.sh
Checks for available system updates using yay.

### .local/bin/install-updates.sh
Installs system updates using yay.

### .local/bin/weather.sh
Fetches weather data for widgets.

### .local/bin/change-wallpaper-random.sh
Changes wallpaper randomly using waypaper or swaybg.

### .local/bin/change-theme-gtk4-and-flatpak.sh
Changes GTK4 and Flatpak applications theme.

### .config/hypr/scripts/xdg-desktop-portal-hyprland.sh
Restarts xdg-desktop-portal services. Important for screen sharing and file dialogs.

```bash
#!/bin/sh
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
```

### .config/hypr/scripts/clean-area-transf.sh
Cleans clipboard after area transfer.

## shellscripts/installPrograms.sh

Installation script that installs all required packages:

```bash
./shellscripts/installPrograms.sh
```

Packages installed include:
- Hyprland ecosystem (hyprland, hyprpaper, hyprlock, etc.)
- Applications (kitty, nautilus, thunderbird, etc.)
- Utilities (yay, fzf, zoxide, etc.)
- Theming (breeze-icons, qt6ct, etc.)

## Adding New Scripts

1. Place scripts in appropriate location:
   - User executables: `.local/bin/`
   - Hyprland-specific: `.config/hypr/scripts/`
   - System scripts: `shellscripts/`

2. Make executable:
   ```bash
   chmod +x script.sh
   ```

3. Add to PATH if needed (for `.local/bin/` it's automatic)

## Best Practices

- Use `#!/bin/bash` or `#!/bin/sh` shebang
- Quote variables: `"$variable"`
- Use `set -e` for scripts that should exit on error
- Keep scripts focused and small

## References

- [Hyprland Scripts](https://wiki.hyprland.org/Configuring/Using-hyprctl/)
