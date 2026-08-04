# Scripts

User scripts and automation tools for system configuration, theming, and maintenance.

## Scripts Location

### User Scripts (`.local/bin/`)

```
.local/bin/
├── colors.conf                     # Material You color library (bash)
├── check-updates.sh                # Check for system updates
├── install-updates.sh              # Install updates with gum UI
├── change-theme-gtk4-and-flatpak.sh # Change GTK/Flatpak theme
├── change-wallpaper-random.sh      # Random wallpaper picker
└── weather.sh                      # Weather widget script
```

### Hyprland Scripts (`.config/hypr/scripts/`)

```
.config/hypr/scripts/
├── xdg-desktop-portal-hyprland.sh  # Restart XDG desktop portals
└── clean-area-transf.sh            # Clean clipboard history
```

### Installation Scripts (`shellscripts/`)

```
shellscripts/
└── installPrograms.sh              # Install all required packages
```

## Script Descriptions

### colors.conf

Bash library that loads Material You color tokens from Noctalia's `colors.json` via `jq`. Exports `HEX_*` variables and Gum styling presets.

```bash
source ~/.local/bin/colors.conf
echo "$HEX_PRIMARY"  # Primary color from wallpaper
```

Key exports:
- `HEX_PRIMARY`, `HEX_SECONDARY`, `HEX_TERTIARY`
- `HEX_SURFACE`, `HEX_ON_SURFACE`
- `GUM_*` styling variables

### check-updates.sh

Checks for available system updates using `checkupdates` (official) and `yay` (AUR). Returns the total count.

```bash
updates=$(~/.local/bin/check-updates.sh)
```

### install-updates.sh

Interactive update script with `gum` UI. Sources `colors.conf` for themed output.

Features:
- Dependency verification (colors.conf, gum, yay, check-updates.sh)
- Lists outdated packages (official + AUR)
- Confirms before updating
- Cleans package cache after update

### change-theme-gtk4-and-flatpak.sh

Changes GTK4 and Flatpak applications theme.

### change-wallpaper-random.sh

Changes wallpaper randomly using waypaper or swaybg.

### weather.sh

Fetches weather data for widgets.

### xdg-desktop-portal-hyprland.sh

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

### clean-area-transf.sh

Cleans clipboard after area transfer operations.

## shellscripts/installPrograms.sh

Installation script that installs all required packages via yay:

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
- Use `set -e` or `set -euo pipefail` for error handling
- Use `gum` for styled output when available
- Source `colors.conf` for themed scripts

## References

- [Hyprland Scripts](https://wiki.hyprland.org/Configuring/Using-hyprctl/)
- [gum](https://github.com/charmbracelet/gum)
