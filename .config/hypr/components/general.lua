hl.config({
	input = {
		-- keyboard
		kb_layout = "us",
		kb_variant = "intl",
		-- mouse
		follow_mouse = 2,
		sensitivity = 0.1,
	},
	general = {
		gaps_in = 2,
		gaps_out = 5,
		border_size = 2,
		layout = "master",
	},

	decoration = {
		rounding = 5,
		rounding_power = 4.0,
		dim_inactive = true,
		blur = {
			size = 5,
			passes = 4,
		},
	},
	animations = {
		enabled = true,
	},

	master = {
		new_status = "master",
		new_on_top = true,
		mfact = 0.5,
	},

	misc = {
		disable_hyprland_logo = true,
	},

	ecosystem = {
		no_donation_nag = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})
