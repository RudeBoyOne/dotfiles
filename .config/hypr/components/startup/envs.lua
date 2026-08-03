------------- SOME DEFAULT ENV VARS --------------
-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- QT Settings
-- hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 1)
-- hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)

-- XCURSOR Settings
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", 18)

-- HYPRCURSOR Settings
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", 18)

-- GDK
hl.env("GDK_SCALE", 1)

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
