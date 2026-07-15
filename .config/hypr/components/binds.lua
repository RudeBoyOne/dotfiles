local programs = require("programs")

local mainMod = "SUPER"
local secondMod = "ALT"
local thirdMod = "SHIFT"

-- Binds Iniciais
hl.bind(mainMod .. " + " .. thirdMod .. " + Q", hl.dsp.exec_cmd(programs.menu_exit))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(programs.locker))
hl.bind(secondMod .. " + " .. thirdMod .. " + W", hl.dsp.exec_cmd(programs.wallpaperPicker))
hl.bind(secondMod .. " + CTRL + U", hl.dsp.exec_cmd(programs.terminal .. " " .. programs.updated))
hl.bind(secondMod .. " + CTRL + W", hl.dsp.exec_cmd(programs.statusbar))

-- ---------------------------- PROGRAMS --------------------------------
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.email))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(programs.emoji))
hl.bind(secondMod .. " + space", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + " .. thirdMod .. " + D", hl.dsp.exec_cmd(programs.discord))
hl.bind(mainMod .. " + " .. secondMod .. " + S", hl.dsp.exec_cmd(programs.music))

-- Notifications
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(programs.notifications))
hl.bind(mainMod .. " + " .. thirdMod .. " + N", hl.dsp.exec_cmd(programs.silent_notifications))
hl.bind(mainMod .. " + " .. secondMod .. " + N", hl.dsp.exec_cmd(programs.clean_notifications))

-- Color picker
hl.bind(mainMod .. " + " .. thirdMod .. " + C", hl.dsp.exec_cmd(programs.color_picker))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(programs.area_transf))
hl.bind(mainMod .. " + " .. thirdMod .. " + V", hl.dsp.exec_cmd(programs.clean_area_transf))

-- Screenshot
hl.bind(mainMod .. " + " .. thirdMod .. " + S", hl.dsp.exec_cmd(programs.screen_shot_not_save))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(programs.screen_shot_save))
hl.bind(mainMod .. " + " .. secondMod .. " + W", hl.dsp.exec_cmd(programs.screen_shot_save_window))
hl.bind(mainMod .. " + " .. secondMod .. " + M", hl.dsp.exec_cmd(programs.screen_shot_save_minitor))

-- Configurations
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(programs.config_manager))

-- Control center
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(programs.control_center))

-- Open apps in specific workspace
hl.bind(secondMod .. " + T", hl.dsp.exec_cmd("[workspace 10 silent] " .. programs.telegram))

-- ------------------------- MANAGER WINDOWS  ------------------------------
hl.bind(mainMod .. " + Q", hl.dsp.killactive())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(secondMod .. " + F", hl.dsp.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.fullscreen("1")) -- Maximize Window

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.movefocus("l"))
hl.bind(mainMod .. " + right", hl.dsp.movefocus("r"))
hl.bind(mainMod .. " + up", hl.dsp.movefocus("u"))
hl.bind(mainMod .. " + down", hl.dsp.movefocus("d"))

-- Move windows without mouse
hl.bind(mainMod .. " + " .. secondMod .. " + left", hl.dsp.swapwindow("l"))
hl.bind(mainMod .. " + " .. secondMod .. " + right", hl.dsp.swapwindow("r"))
hl.bind(mainMod .. " + " .. secondMod .. " + up", hl.dsp.swapwindow("u"))
hl.bind(mainMod .. " + " .. secondMod .. " + down", hl.dsp.swapwindow("d"))

-- Resize windows without mouse (usando a nova sintaxe de redimensionamento nativa)
hl.bind(mainMod .. " + " .. thirdMod .. " + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + " .. thirdMod .. " + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + " .. thirdMod .. " + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
hl.bind(mainMod .. " + " .. thirdMod .. " + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))

-- Move/resize windows with mainMod + LMB/RMB and dragging (antigo bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --------------------------- MANAGER WORKSPACES -------------------------------
for i = 1, 9 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.workspace(key))
	hl.bind(mainMod .. " + " .. thirdMod .. " + " .. key, hl.dsp.movetoworkspace(key))
end

-- Workspaces 0 (mapeado para workspace 10)
hl.bind(mainMod .. " + 0", hl.dsp.workspace("10"))
hl.bind(mainMod .. " + " .. thirdMod .. " + 0", hl.dsp.movetoworkspace("10"))

-- Alternar workspaces com Tab
hl.bind(mainMod .. " + Tab", hl.dsp.workspace("m+1"))
hl.bind(mainMod .. " + " .. thirdMod .. " + Tab", hl.dsp.workspace("m-1"))

-- ---------------- FN KEYS, VOLUME AND MEDIA CONTROL ------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(programs.volume_increase), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(programs.volume_decrease), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(programs.volume_mute), { locked = true })

hl.bind(mainMod .. " + " .. thirdMod .. " + M", hl.dsp.exec_cmd("pamixer --default-source -t"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
