local programs = require("programs")

local mainMod = "SUPER"
local secondMod = "ALT"
local thirdMod = "SHIFT"

---------------------------- MANAGER SESSION -------------------------
hl.bind(mainMod .. " + " .. thirdMod .. " + Q", hl.dsp.exec_cmd(programs.menu_exit),
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(programs.locker),
hl.bind(secondMod .. " + " .. thirdMod ..  " + W", hl.dsp.exec_cmd(programs.wallpaperPicker),
hl.bind(secondMod .. " + CTRL + U", hl.dsp.exec_cmd(programs.terminal, programs.updated),
hl.bind(secondMod CTRL, W, exec, $statusbar

# ---------------------------- PROGRAMS --------------------------------
hl.bind(mainMod, Return, exec, $terminal
hl.bind(mainMod, D, exec, $fileManager
hl.bind(mainMod, B, exec, $browser
hl.bind(mainMod, E, exec, $email
hl.bind(mainMod, I,  exec, $emoji
hl.bind(secondMod, space, exec, $menu
hl.bind(mainMod thirdMod, D, exec, $discord
hl.bind(mainMod secondMod, S, exec, $music

#notifications
hl.bind(mainMod, N, exec, $notifications
hl.bind(mainMod thirdMod, N, exec, $silent_notifications
hl.bind(mainMod secondMod, N, exec, $clean_notifications

# color picker
hl.bind(mainMod thirdMod, C,  exec, $color_picker

# clipboard
hl.bind(mainMod, V, exec, $area_transf
hl.bind(mainMod thirdMod, V, exec, $clean_area_transf

# screenshot
hl.bind(mainMod thirdMod, S, exec, $screen_shot_not_save
hl.bind(mainMod, PRINT,  exec,  $screen_shot_save
hl.bind(mainMod secondMod, W, exec, $screen_shot_save_window
hl.bind(mainMod secondMod, M, exec, $screen_shot_save_minitor

# configurations
hl.bind(mainMod, comma, exec, $config_manager

#control center
hl.bind(mainMod, C, exec, $control_center

# open apps in specific workspace
hl.bind(secondMod, T, exec, [workspace 10 silent] $telegram

# ------------------------- MANAGER WINDOWS  ------------------------------
hl.bind(mainMod, Q, killactive,
hl.bind(mainMod, F, togglefloating,
hl.bind(secondMod, F, fullscreen,
hl.bind(mainMod, M, fullscreen, 1   # Maximize Window

# Move focus with mainMod + arrow keys
hl.bind(mainMod, left, movefocus, l
hl.bind(mainMod, right, movefocus, r
hl.bind(mainMod, up, movefocus, u
hl.bind(mainMod, down, movefocus, d

# Move windows without mouse
hl.bind(mainMod secondMod, left, swapwindow, l
hl.bind(mainMod secondMod, right, swapwindow, r
hl.bind(mainMod secondMod, up, swapwindow, u
hl.bind(mainMod secondMod, down, swapwindow, d

# Resize windows without mouse
hl.bind(mainMod thirdMod, right, resizeactive, 50 0
hl.bind(mainMod thirdMod, left, resizeactive, -50 0
hl.bind(mainMod thirdMod, down, resizeactive, 0 50
hl.bind(mainMod thirdMod, up, resizeactive, 0 -50

# Move/resize windows with mainMod + LMB/RMB and dragging 
bindm = mainMod, mouse:272, movewindow
bindm = mainMod, mouse:273, resizewindow

# --------------------------- MANAGER WORKSPACES -------------------------------
# Switch workspaces with mainMod + [0-9]
hl.bind(mainMod, 1, workspace, 1
hl.bind(mainMod, 2, workspace, 2
hl.bind(mainMod, 3, workspace, 3
hl.bind(mainMod, 4, workspace, 4
hl.bind(mainMod, 5, workspace, 5
hl.bind(mainMod, 6, workspace, 6
hl.bind(mainMod, 7, workspace, 7
hl.bind(mainMod, 8, workspace, 8
hl.bind(mainMod, 9, workspace, 9
hl.bind(mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + thirdMod + [0-9]
hl.bind(mainMod thirdMod, 1, movetoworkspace, 1
hl.bind(mainMod thirdMod, 2, movetoworkspace, 2
hl.bind(mainMod thirdMod, 3, movetoworkspace, 3
hl.bind(mainMod thirdMod, 4, movetoworkspace, 4
hl.bind(mainMod thirdMod, 5, movetoworkspace, 5
hl.bind(mainMod thirdMod, 6, movetoworkspace, 6
hl.bind(mainMod thirdMod, 7, movetoworkspace, 7
hl.bind(mainMod thirdMod, 8, movetoworkspace, 8
hl.bind(mainMod thirdMod, 9, movetoworkspace, 9
hl.bind(mainMod thirdMod, 0, movetoworkspace, 10

hl.bind(mainMod, Tab, workspace, m+1
hl.bind(mainMod thirdMod, Tab, workspace, m-1

# ---------------- FN KEYS, VOLUME AND MEDIA CONTROL ------------------
bindel = , XF86AudioRaiseVolume, exec, $volume_increase 
bindel = , XF86AudioLowerVolume, exec, $volume_decrease
bindl = , XF86AudioMute, exec, $volume_mute

hl.bind(  mainMod thirdMod, M, exec, pamixer --default-source -t
hl.bind(, XF86AudioPlay, exec, playerctl play-pause
hl.bind(, XF86AudioPause, exec, playerctl pause
hl.bind(, XF86AudioNext, exec, playerctl next
hl.bind(, XF86AudioPrev, exec, playerctl previous
