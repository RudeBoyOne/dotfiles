# Window Rules

Window and layer rules configuration for Hyprland, using the Lua `hl.window_rule()` and `hl.layer_rule()` API.

## File Location

Rules are located in `.config/hypr/components/rules/`:

```
rules/
├── rules.lua           # Main file that loads window-rule + layer-rule
├── window-rule.lua     # Window-specific rules
└── layer-rule.lua      # Layer rules
```

## Window Rules Syntax

```lua
hl.window_rule({
    name = "rule-name",
    match = { class = "WindowClass" },
    -- rule properties
})
```

### Match Criteria

| Property | Description |
|----------|-------------|
| `class` | Window class (regex supported) |
| `title` | Window title (regex supported) |

### Rule Properties

| Property | Type | Description |
|----------|------|-------------|
| `float` | boolean | Make window floating |
| `size` | `{width, height}` | Set specific size |
| `center` | boolean | Center on screen |
| `move` | `{x, y}` | Move to position |
| `no_anim` | boolean | Disable animations |
| `blur` | boolean | Enable blur |
| `ignore_alpha` | number | Ignore alpha for blur |

## Current Window Rules

### Floating Windows

```lua
hl.window_rule({
    name = "calc-float",
    match = { class = "org.gnome.Calculator" },
    float = true,
    size = { 360, 616 },
    center = true,
})

hl.window_rule({
    name = "nautilus-float",
    match = { class = "org.gnome.Nautilus" },
    float = true,
    size = { 996, 655 },
    center = true,
})

hl.window_rule({
    name = "kitty-float",
    match = { class = "kitty" },
    float = true,
    size = { 875, 541 },
    center = true,
})

hl.window_rule({
    name = "fileroller-float",
    match = { class = "org.gnome.FileRoller" },
    float = true,
    size = { 819, 562 },
    center = true,
})

hl.window_rule({
    name = "solanum-main",
    match = { class = "org.gnome.Solanum" },
    float = true,
    size = { 360, 294 },
    move = { 1552, 42 },
})

hl.window_rule({
    name = "localsend-float",
    match = { class = "localsend" },
    float = true,
    size = { 658, 614 },
    center = true,
})

hl.window_rule({
    name = "remote-viewer-float",
    match = { class = "remote-viewer" },
    float = true,
})
```

### Window Rules Table

| Class | Size | Position |
|-------|------|----------|
| `org.gnome.Calculator` | 360x616 | Center |
| `org.gnome.Nautilus` | 996x655 | Center |
| `kitty` | 875x541 | Center |
| `org.gnome.FileRoller` | 819x562 | Center |
| `org.gnome.Solanum` | 360x294 | Custom (1552, 42) |
| `localsend` | 658x614 | Center |
| `remote-viewer` | Float | - |

## Layer Rules Syntax

```lua
hl.layer_rule({
    name = "rule-name",
    match = { namespace = "layer-namespace" },
    -- rule properties
})
```

### Layer Rule Properties

| Property | Type | Description |
|----------|------|-------------|
| `no_anim` | boolean | Disable animations |
| `blur` | boolean | Enable blur |
| `blur_popups` | boolean | Blur popup surfaces |
| `ignore_alpha` | number | Ignore alpha threshold for blur |

## Current Layer Rules

```lua
-- hyprpicker - no animation
hl.layer_rule({
    name = "hyprpicker-noanim",
    match = { namespace = "hyprpicker" },
    no_anim = true,
})

-- Selection (hyprshot) - no animation
hl.layer_rule({
    name = "selection-noanim",
    match = { namespace = "selection" },
    no_anim = true,
})

-- Noctalia backgrounds - blur
hl.layer_rule({
    name = "noctalia",
    match = { namespace = "noctalia-background-.*$" },
    ignore_alpha = 0.7,
    blur = true,
    blur_popups = true,
})

-- Vicinae - blur
hl.layer_rule({
    name = "vicinae-blur",
    match = { namespace = "vicinae" },
    blur = true,
    blur_popups = true,
    ignore_alpha = 0.5,
})
```

### Layer Rules Table

| Namespace | Rules |
|-----------|-------|
| `hyprpicker` | No animation |
| `selection` | No animation |
| `noctalia-background-*` | Blur, ignore_alpha 0.7 |
| `vicinae` | Blur, ignore_alpha 0.5 |

## Dynamic Rules

Named rules can be dynamically enabled/disabled:

```lua
local myRule = hl.window_rule({
    name  = "my-rule",
    match = { class = "kitty" },
    border_size = 5,
})

myRule:set_enabled(false)  -- disable
myRule:set_enabled(true)   -- re-enable
myRule:is_enabled()        -- query status
```

## Adding New Rules

### Window Rules

1. Find window class: `xprop | grep CLASS`
2. Add rule to `window-rule.lua`:

```lua
hl.window_rule({
    name = "myapp-float",
    match = { class = "myapp" },
    float = true,
    size = { 800, 600 },
    center = true,
})
```

### Layer Rules

1. Find layer namespace: `hyprctl layers`
2. Add rule to `layer-rule.lua`:

```lua
hl.layer_rule({
    name = "mylayer-blur",
    match = { namespace = "mylayer" },
    blur = true,
    ignore_alpha = 0.5,
})
```

## References

- [Hyprland Window Rules](https://wiki.hyprland.org/Configuring/Window-Rules/)
