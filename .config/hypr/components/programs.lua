local programs = {}

local ipc = "qs -c noctalia-shell ipc call"

-- =========================================================================
-- DEFINIÇÃO DOS PROGRAMAS E COMANDOS
-- =========================================================================
programs.terminal = "uwsm-app -- kitty"
programs.fileManager = "uwsm-app -- nautilus"
programs.browser = "uwsm-app -- zen-browser"
programs.email = "uwsm-app -- thunderbird"
programs.editor_config = "code"
programs.telegram = "uwsm-app -- Telegram"
programs.discord = "uwsm-app -s b -- discord"
programs.music = "uwsm-app -s b -- spotify-launcher"

-- =========================================================================
-- COMANDOS DE INTERFACE E UTILITÁRIOS (Usando a variável 'ipc')
-- =========================================================================
programs.menu = " vicinae toggle"
programs.emoji = ipc .. " launcher emoji"
programs.locker = ipc .. " lockScreen lock"
programs.menu_exit = ipc .. " sessionMenu toggle"
programs.statusbar = ipc .. " bar toggle"
programs.wallpaperPicker = ipc .. " wallpaper random"
programs.config_manager = ipc .. " settings toggle"
programs.control_center = ipc .. " controlCenter toggle"

programs.area_transf = ipc .. " plugin:clipper toggle"
programs.clean_area_transf = "~/.config/hypr/scripts/clean-area-transf.sh"
programs.color_picker = "uwsm-app -- hyprpicker --autocopy"
programs.updated = "~/.local/bin/install-updates.sh"

-- =========================================================================
-- NOTIFICAÇÕES
-- =========================================================================
programs.notifications = ipc .. " notifications toggleHistory"
programs.silent_notifications = ipc .. " notifications toggleDND"
programs.clean_notifications = ipc .. " notifications clear"

-- =========================================================================
-- VOLUME E MÍDIA
-- =========================================================================
programs.volume_increase = ipc .. " volume increase"
programs.volume_decrease = ipc .. " volume decrease"
programs.volume_mute = ipc .. " volume muteOutput"

-- =========================================================================
-- SCREENSHOTS
-- =========================================================================
programs.screen_shot_save = "uwsm-app -- hyprshot -m region -o ~/Pictures/screenshots"
programs.screen_shot_save_window = "uwsm-app -- hyprshot -m window -active -o ~/Pictures/screenshots"
programs.screen_shot_save_minitor = "uwsm-app -- hyprshot -m output -m DP-1 -o ~/Pictures/screenshots"

-- Exporta a tabela para ser usada em outros arquivos
return programs
