-- Hyprland config (Lua, Hyprland >= 0.55)
-- See https://wiki.hypr.land/Configuring/Start/

-- Monitor Setup
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
-- hl.monitor({ output = "", mode = "2560x1440", position = "auto", scale = 2 })
-- hl.monitor({ output = "", mode = "1920x1080", position = "auto", scale = 1 })

-- Autostart & Environment
require("conf/environment")
require("conf/autostart")

-- Load configuration files
require("conf/keyboard")
require("conf/window")
require("conf/decoration")
require("conf/layouts")
require("conf/misc")
require("conf/keybindings")
require("conf/windowrules")
require("conf/layerrules")
require("conf/animations")

-- Settings chosen in the settings menu (Alt+Shift+S, scripts/settings.sh).
-- Kept outside the Ansible-managed config so a deploy does not reset them,
-- and loaded last so they override the defaults above.
local settings = os.getenv("HOME") .. "/.local/state/hypr/settings.lua"
local settings_file = io.open(settings, "r")
if settings_file then
    settings_file:close()
    dofile(settings)
end
