-- =========================================================================
-- FLOAT, SIZE AND CENTER WINDOWS
-- =========================================================================
hl.window_rule({
	name = "gtk-portal",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
	size = { 924, 609 },
	center = true,
})

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
	name = "solanum-prefs",
	match = {
		class = "solanum",
		title = "Preferências",
	},
	center = true,
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
