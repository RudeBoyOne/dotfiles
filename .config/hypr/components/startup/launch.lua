# --------- LAUNCH APPS FOR SESSION ----------------
local cursor = "hyprctl setcursor Bibata-Modern-Ice 18"
local wlClipPersist = "uwsm-app -s s -- wl-clip-persist --clipboard regular"
local hyprlandDesktopPortal =" ~/.config/hypr/scripts/xdg-desktop-portal-hyprland.sh"
local noctalia = "noctalia"
local keyringDaemon = "gnome-keyring-daemon --start --components=secrets"
local configDbus = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local confiQt = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME"
local udiskie = "uswm-app -s s -- udiskie"
local vicinae = "vicinae server"
local nordvpnTray = "nordvpn status"

hl.on("hyprland.start", function ()
  hl.exec_cmd(udiskie)
  hl.exec_cmd(cursor)
  hl.exec_cmd(wlClipPersist)
  hl.exec_cmd(hyprlandDesktopPortal)
  hl.exec_cmd(noctalia)
  hl.exec_cmd(keyringDaemon)
  hl.exec_cmd(configDbus)
  hl.exec_cmd(confiQt)
  hl.exec_cmd(vicinae)
  hl.exec_cmd(nordvpnTray)
end)
