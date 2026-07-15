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

-- Noctalia Backgrounds
hl.layer_rule({
	name = "noctalia",
	match = { namespace = "noctalia-background-.*$" },
	ignore_alpha = 0.7,
	blur = true,
	blur_popups = true,
})
