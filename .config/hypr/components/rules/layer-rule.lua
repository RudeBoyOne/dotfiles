-- =========================================================================
-- LAYER RULES
-- =========================================================================

-- hyprpicker
hl.layer_rule({
	name = "hyprpicker-noanim",
	match = { namespace = "hyprpicker" },
	no_anim = true,
})

-- Remove 1px border around hyprshot screenshots
hl.layer_rule({
	name = "selection-noanim",
	match = { namespace = "selection" },
	no_anim = true,
})

-- noctalia
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- Blur Vincinae
hl.layer_rule({
	name = "vicinae-blur",
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.5,
	match = { namespace = "vicinae" },
})
