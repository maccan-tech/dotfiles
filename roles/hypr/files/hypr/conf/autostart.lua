------------------------------
-- Autostart
------------------------------

-- hyprland.start only fires on session start, not on config reload (same as exec-once)
hl.on("hyprland.start", function()
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("~/.config/waybar/launch.sh")
    hl.exec_cmd("swaync")
    hl.exec_cmd("~/.config/hypr/scripts/hypridle.sh") -- Timeouts from the settings menu
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-paste --watch cliphist store") -- Clipboard history

    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") -- Some fix idk

    -- Auto start applications
    hl.exec_cmd("kitty", { workspace = "1 silent" })
    hl.exec_cmd("nextcloud")
    hl.exec_cmd("kdeconnect-indicator")

    hl.exec_cmd("~/.config/hypr/gtk.sh")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
end)
