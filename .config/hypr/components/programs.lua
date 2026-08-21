local programs = {}

local ipc = "noctalia msg"

-- =========================================================================
-- DEFINIÇÃO DOS PROGRAMAS
-- =========================================================================
programs.terminal = "uwsm-app -- kitty"
programs.file_manager = "uwsm-app -- yazi"
programs.browser = "uwsm-app -- zen-browser"
programs.email = "uwsm-app -- thunderbird"
programs.editor_config = "code"
programs.telegram = "uwsm-app -- Telegram"
programs.discord = "uwsm-app -s b -- vesktop"
programs.music = "uwsm-app -s b -- spotify-launcher"

-- =========================================================================
-- COMANDOS DE INTERFACE E UTILITÁRIOS
-- =========================================================================
programs.menu = " vicinae toggle"
programs.emoji = ipc .. " launcher emoji"
programs.locker = ipc .. " session lock"
programs.menu_exit = ipc .. " panel-toggle session"
programs.statusbar = ipc .. " bar-toggle"
programs.wallpaper_random = ipc .. " wallpaper-random"
programs.config_manager = ipc .. " settings-open"
programs.control_center = ipc .. " panel-toggle control-center"

programs.area_transf = ipc .. " panel-toggle clipboard"
programs.clean_area_transf = ipc .. " clipboard-clear"
programs.color_picker = "uwsm-app -- hyprpicker --autocopy"
programs.updated = "~/.local/bin/install-updates.sh"

-- =========================================================================
-- NOTIFICAÇÕES
-- =========================================================================
programs.notifications = ipc .. " panel-toggle control-center notifications"
programs.silent_notifications = ipc .. " notification-dnd-toggle"
programs.clean_notifications = ipc .. " notification-clear-history"

-- =========================================================================
-- VOLUME E MÍDIA
-- =========================================================================
programs.volume_increase = ipc .. " volume-up"
programs.volume_decrease = ipc .. " volume-down"
programs.volume_mute = ipc .. " volume-mute"
programs.media_previous = ipc .. " media previous"
programs.media_next = ipc .. " media next"
programs.media_play_pause = ipc .. " media toggle"
programs.mic_mute = ipc .. " mic-mute"

-- =========================================================================
-- SCREENSHOTS
-- =========================================================================
programs.screen_shot_region = ipc .. " screenshot-region"
programs.screen_shot_fullscreen = ipc .. " screenshot-fullscreen"

-- Exporta a tabela para ser usada em outros arquivos
return programs
