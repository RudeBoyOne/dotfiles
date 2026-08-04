# Hyprland Configuration

Lua-based Hyprland configuration using the `hl.*` API with modular component architecture.

## File Structure

```
.config/hypr/
├── hyprland.lua          # Main entry point - loads all components
├── .luarc.json           # LSP config pointing to /usr/share/hypr/stubs
├── hyprtoolkit.conf      # Theme colors (dark palette)
├── components/
│   ├── animations.lua    # 22 custom Bezier curves + animation rules
│   ├── binds.lua         # Keybindings with hl.bind() API
│   ├── general.lua       # Input, general, decoration, misc settings
│   ├── monitors.lua      # Monitor config (auto, highres)
│   ├── programs.lua      # App definitions table (returns module)
│   ├── rules/
│   │   ├── rules.lua     # Loads window-rule + layer-rule
│   │   ├── window-rule.lua  # Float/size rules for specific apps
│   │   └── layer-rule.lua   # Layer rules (hyprpicker, noctalia, vicinae)
│   └── startup/
│       ├── startup.lua       # Loads envs, modifierkeys, launch
│       ├── envs.lua          # Environment variables (XDG, Qt, cursor, GDK)
│       ├── launch.lua        # Apps launched on hyprland.start event
│       └── modifierkeys.lua  # Modifier key constants
├── scripts/
│   ├── clean-area-transf.sh              # Clears clipboard history
│   └── xdg-desktop-portal-hyprland.sh    # Restarts XDG portal
└── noctalia/
    └── noctalia-colors.conf  # Noctalia border/group colors (gitignored)
```

## Main Entry Point

`hyprland.lua` loads components in order using `require()`:

```lua
------------------- INITIALIZE ----------------------
require("components.startup.startup")

------------------- MONITORS ------------------------
require("components.monitors")

------------------- GENERAL CONFIGS -----------------
require("components.general")

------------------- ANIMATIONS ----------------------
require("components.animations")

------------------ SHORTCUTS ----------------------
require("components.binds")

------------------------ RULES  --------------------
require("components.rules.rules")
```

## Key API Functions

| Function | Description |
|----------|-------------|
| `hl.config({...})` | Set configuration values (general, input, decoration, etc.) |
| `hl.bind(key, handler, opts)` | Register keybindings |
| `hl.window_rule({...})` | Define window rules with name and match criteria |
| `hl.layer_rule({...})` | Define layer rules for non-window surfaces |
| `hl.animation({...})` | Configure animation properties per leaf |
| `hl.curve(name, {...})` | Define custom Bezier or spring curves |
| `hl.env(name, value)` | Set environment variables |
| `hl.on(event, callback)` | Register event handlers (e.g., `hyprland.start`) |
| `hl.exec_cmd(command)` | Execute shell commands |

## Configuration Example

```lua
-- General settings
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 2,
        layout = "master",
    },
    decoration = {
        rounding = 5,
        blur = { size = 5, passes = 4 },
    },
})

-- Environment variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XCURSOR_SIZE", "18")

-- Event handler
hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c noctalia-shell --no-duplicate")
end)
```

## LSP Support

The `.luarc.json` file configures the Lua Language Server to recognize the `hl.*` API:

```json
{
  "workspace": {
    "library": ["/usr/share/hypr/stubs"]
  }
}
```

This provides autocomplete and type checking for all Hyprland Lua API functions.

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Configuration Docs](https://wiki.hyprland.org/Configuring/)
- [Lua Configuration API](https://wiki.hyprland.org/Configuring/)
