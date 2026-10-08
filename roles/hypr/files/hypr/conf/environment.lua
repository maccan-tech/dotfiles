------------------------------
-- Environment Variables
------------------------------

hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

-- GTK dark mode (GTK3 env var + GTK4/libadwaita via gsettings color-scheme in gtk.sh)
hl.env("GTK_THEME", "Adwaita:dark")

-- Qt dark mode
-- Qt5: qt5-qtstyleplugins provides the gtk3 platform theme
-- Qt6: qt6ct provides color-scheme-aware theming (hyprpolkitagent and other Qt6 apps)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- App compatibility
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
