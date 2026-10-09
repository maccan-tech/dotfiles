------------------------------
-- Window rules
------------------------------

-- Every rule has a name, so it shows up in hyprctl and can be turned off with
-- set_enabled. Patterns match the whole class or title, not a part of it.
local function rule(name, match, effects)
    effects.name = name
    effects.match = match
    hl.window_rule(effects)
end

-- Fixed sizes for floating windows, capped to the monitor so they never end
-- up larger than a small laptop screen
local function fit(w, h)
    return {
        "min(" .. w .. ", monitor_w * 0.92)",
        "min(" .. h .. ", monitor_h * 0.88)",
    }
end

-- Ignore maximize requests from apps (kitty asks to be maximized on open,
-- which covered the whole workspace instead of tiling)
rule("suppress-maximize", { class = ".*" }, { suppress_event = "maximize" })

-- XWayland apps (like Thorium) create nameless helper windows during drag and
-- drop; without this they can take focus from the window being dragged
rule("fix-xwayland-drags",
    { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    { no_focus = true })

------------------------------
-- Opacity
------------------------------

-- rule("opacity-all", { class = ".*" }, { opacity = "0.89 override 0.89 override" }) -- Applies transparency to EVERY WINDOW
rule("opacity-thorium", { class = "^(Thorium-browser)$" }, { opacity = "0.90 0.80" })
rule("opacity-thorium-youtube", { class = "^(Thorium-browser)$", title = "^(.*YouTube.*)$" }, { opacity = "1.0 override 1.0" })
rule("opacity-thunar", { class = "^(thunar)$" }, { opacity = "0.85 0.85" })
rule("opacity-kitty", { class = "^(kitty)$" }, { opacity = "0.90 0.85" })
rule("opacity-obsidian", { class = "^(obsidian)$" }, { opacity = "0.80 0.80" })
rule("opacity-pavucontrol", { class = "^(pavucontrol)$" }, { opacity = "0.80 0.70" })
rule("opacity-blueman", { class = "^(blueman-manager)$" }, { opacity = "0.80 0.70" })
rule("opacity-nm-connection-editor", { class = "^(nm-connection-editor)$" }, { opacity = "0.80 0.70" })

------------------------------
-- Floating windows and dialogs
------------------------------

-- Dialogs, matched by title
local dialogs = {
    { "open-file", "^(Open File)(.*)$" },
    { "select-file", "^(Select a File)(.*)$" },
    { "open-folder", "^(Open Folder)(.*)$" },
    { "save-as", "^(Save As)(.*)$" },
    { "library", "^(Library)(.*)$" },
    { "file-upload", "^(File Upload)(.*)$" },
}
for _, dialog in ipairs(dialogs) do
    rule("float-" .. dialog[1], { title = dialog[2] }, { float = true, center = true })
end

-- File pickers and other dialogs opened through the desktop portal; their
-- titles vary, so the title rules above do not catch them all
rule("float-portal", { class = "^(xdg-desktop-portal-gtk)$" }, { float = true, center = true })

-- Password prompt from hyprpolkitagent (e.g. the System page in the settings menu)
rule("float-polkit", { class = "^(hyprpolkitagent)$" }, { float = true, center = true })

-- Bitwarden stays out of screen shares
rule("float-bitwarden", { class = "^(Thorium-browser)$", title = "^(Bitwarden)(.*)$" },
    { float = true, no_screen_share = true })

local floating = {
    { "pavucontrol", "^(pavucontrol)$" },
    { "blueman", "^(blueman-manager)$" },
    { "nm-connection-editor", "^(nm-connection-editor)$" },
    { "ark", "^(org.kde.ark)$" },
    { "kcalc", "^(org.kde.kcalc)$" },
    { "klipper", "^(org.kde.klipper)$" },
}
for _, app in ipairs(floating) do
    rule("float-" .. app[1], { class = app[2] }, { float = true })
end

rule("float-nextcloud", { class = "^(com.nextcloud.desktopclient.nextcloud)$" }, { float = true, size = fit(530, 630) })

-- bluetui runs in kitty, started from the settings menu and waybar
rule("float-bluetui", { class = "^(bluetui)$" }, { float = true, size = fit(900, 600), center = true })

-- Mount and unmount scripts in yazi; both open kitty with this title
rule("float-mount-usb", { title = "^(mount-usb)$" }, { float = true, size = fit(500, 200), center = true })

-- satty screenshot editor: fixed size so small selections don't shrink the
-- editor, the image is scaled to fit inside the window instead
rule("float-satty", { class = "^(com.gabm.satty)$" },
    { float = true, size = { "monitor_w*0.6", "monitor_h*0.7" }, center = true })

-- Picture-in-picture video from browsers: small, in the top right corner and
-- pinned so it stays visible on every workspace
rule("pip", { title = "^(Picture.?in.?[Pp]icture)$" }, {
    float = true,
    pin = true,
    size = { 600, 338 },
    keep_aspect_ratio = true,
    border_size = 0,
    move = { "(monitor_w-window_w-40)", "(monitor_h*0.04)" },
})

------------------------------
-- Browsers, video and games
------------------------------

-- Keep the screen on while video or a game is fullscreen, so watching without
-- touching the keyboard does not dim or lock the screen
rule("idle-inhibit-fullscreen",
    { class = "^(Thorium-browser|Mullvad Browser|google-chrome|firefox|mpv|vlc|steam|steam_app_.*)$" },
    { idle_inhibit = "fullscreen" })

-- Chromium's "... is sharing a window" bar opens mid-screen and takes no
-- input; park it on a special workspace nobody opens. "silent" keeps that
-- workspace from opening.
rule("park-share-indicator", { class = "^$", title = "^(.*is sharing.*)$" },
    { workspace = "special:sharebar silent", no_focus = true })
