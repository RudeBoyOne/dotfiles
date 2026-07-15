-- =========================================================================
-- FLOAT, SIZE AND CENTER WINDOWS
-- =========================================================================
-- Calculadora
hl.window_rule({ class = "org.gnome.Calculator" }, {
	{ prop = "float" },
	{ prop = "size", value = { 360, 616 } },
	{ prop = "center" },
})

-- Nautilus
hl.window_rule({ class = "org.gnome.Nautilus" }, {
	{ prop = "float" },
	{ prop = "size", value = { 996, 655 } },
	{ prop = "center" },
})

-- Kitty
hl.window_rule({ class = "kitty" }, {
	{ prop = "float" },
	{ prop = "size", value = { 875, 541 } },
	{ prop = "center" },
})

-- File Roller
hl.window_rule({ class = "org.gnome.FileRoller" }, {
	{ prop = "float" },
	{ prop = "size", value = { 819, 562 } },
	{ prop = "center" },
})

-- Solanum (Janela principal)
hl.window_rule({ class = "org.gnome.Solanum" }, {
	{ prop = "float" },
	{ prop = "size", value = { 360, 294 } },
	{ prop = "move", value = { 1552, 42 } },
})

-- Solanum (Preferências)
hl.window_rule({ class = "org.gnome.Solanum", title = "Preferências" }, {
	{ prop = "center" },
})

-- LocalSend
hl.window_rule({ class = "localsend" }, {
	{ prop = "float" },
	{ prop = "size", value = { 658, 614 } },
	{ prop = "center" },
})

-- Remote Viewer
hl.window_rule({ class = "remote-viewer" }, {
	{ prop = "float" },
})

-- Xdg-desktop-portal-gtk (Regra genérica da primeira seção)
hl.window_rule({ class = "Xdg-desktop-portal-gtk" }, {
	{ prop = "float" },
})

-- =========================================================================
-- FOCUS PROBLEMS (IntelliJ / JetBrains & XWayland)
-- =========================================================================

hl.window_rule({ xwayland = true }, {
	{ prop = "noinitialfocus" },
	{ prop = "noblur" },
})

hl.window_rule({ class = "^(.*jetbrains.*)$", title = "^\\s$" }, {
	{ prop = "nofocus" },
})

-- =========================================================================
-- XDG-DESKTOP-PORTAL-GTK (Especificidades)
-- =========================================================================

-- Para "Xdg-desktop-portal-gtk" (com X maiúsculo)
hl.window_rule({ class = "Xdg-desktop-portal-gtk" }, {
	{ prop = "noshadow" },
	{ prop = "decorate", value = false },
	{ prop = "dimaround" },
})

-- Para "xdg-desktop-portal-gtk" (com x minúsculo)
hl.window_rule({ class = "xdg-desktop-portal-gtk" }, {
	{ prop = "float" },
	{ prop = "size", value = { 932, 670 } },
	{ prop = "center" },
	{ prop = "dimaround" },
})
