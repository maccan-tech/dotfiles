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
require("conf/animations")
