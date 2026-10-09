------------------------------
-- Window rules
------------------------------

local function rule(match, effects)
    effects.match = match
    hl.window_rule(effects)
end

-- Ignore maximize requests from apps (kitty asks to be maximized on open,
-- which covered the whole workspace instead of tiling)
rule({ class = ".*" }, { suppress_event = "maximize" })

-- rule({ class = ".*" }, { opacity = "0.89 override 0.89 override" }) -- Applies transparency to EVERY WINDOW
rule({ class = "^(Thorium-browser)$" }, { opacity = "0.90 0.80" })
rule({ class = "^(Thorium-browser)$", title = "(YouTube)(.*)$" }, { opacity = "1.0 override 1.0" })
rule({ class = "^(thunar)$" }, { opacity = "0.85 0.85" })
rule({ class = "^(kitty)$" }, { opacity = "0.90 0.85" })
rule({ class = "^(obsidian)$" }, { opacity = "0.80 0.80" })
rule({ class = "^(pavucontrol)$" }, { opacity = "0.80 0.70" })
rule({ class = "^(blueman-manager)$" }, { opacity = "0.80 0.70" })
rule({ class = "^(nm-applet)$" }, { opacity = "0.80 0.70" })
rule({ class = "^(nm-connection-editor)$" }, { opacity = "0.80 0.70" })

-- Dialogs
local dialogs = {
    "^(Open File)(.*)$",
    "^(Select a File)(.*)$",
    "^(Choose wallpaper)(.*)$",
    "^(Open Folder)(.*)$",
    "^(Save As)(.*)$",
    "^(Library)(.*)$",
    "^(File Upload)(.*)$",
}
for _, title in ipairs(dialogs) do
    rule({ title = title }, { float = true, center = true })
end

rule({ class = "^(Thorium-browser)$", title = "(Bitwarden)(.*)$" }, { float = true })

local floating = {
    "^(pavucontrol)$",
    "^(blueman-manager)$",
    "^(nm-applet)$",
    "^(nm-connection-editor)$",
    "^(org.kde.ark)$",
    "^(org.kde.kcalc)$",
    "^(org.kde.klipper)$",
    "^(org.kde.polkit-kde-authentication-agent-1)$",
}
for _, class in ipairs(floating) do
    rule({ class = class }, { float = true })
end

rule({ class = "^(com.nextcloud.desktopclient.nextcloud)$" }, { float = true, size = { 530, 630 } })

-- bluetui runs in kitty, started from the settings menu and waybar
rule({ class = "^(bluetui)$" }, { float = true, size = { 900, 600 }, center = true })

-- mount/unmount scripts for yazi
rule({ title = "(mount-usb)" }, { float = true, size = { 500, 200 }, center = true })
rule({ title = "(unmount-usb)" }, { float = true, size = { 500, 200 }, center = true })

-- satty screenshot editor: fixed size so small selections don't shrink the
-- editor, the image is scaled to fit inside the window instead
rule({ class = "^(com.gabm.satty)$" }, { float = true, size = { "monitor_w*0.6", "monitor_h*0.7" }, center = true })
