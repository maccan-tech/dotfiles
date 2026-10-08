------------------------------
-- Key bindings
------------------------------

-- Set programs that you use
local terminal = "kitty"
-- local menu = "wofi --show drun"
local menu = "~/.config/hypr/scripts/applauncher.sh"
local browser = "thorium-browser"
-- local notes = "kitty -e nvim ~/Vaults/today.md"
-- local fileManager = "kitty -e tmux new-session -d 'yazi' \\; set-option remain-on-exit on \\; attach &"
local fileManager = "yazi"
local fileManager2 = "thunar"

-- Super key
-- local mainMod = "SUPER"
local mainMod = "ALT"

local function key(k)
    return mainMod .. " + " .. k
end

hl.bind(key("RETURN"), hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(key("SHIFT + Q"), hl.dsp.window.close(), { description = "Close window" })
hl.bind(key("F"), hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(key("SHIFT + F"), hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(key("B"), hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind(key("S"), hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(key("H"), hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind(key("right"), hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind(key("CTRL + L"), hl.dsp.exec_cmd("hyprlock"), { description = "Lock screen" })
hl.bind(key("L"), hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind(key("left"), hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind(key("up"), hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind(key("K"), hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind(key("down"), hl.dsp.focus({ direction = "d" }), { description = "Focus down" })
hl.bind(key("J"), hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

hl.bind(key("PRINT"), hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"), { description = "Screenshot" })
hl.bind(key("P"), hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"), { description = "Screenshot" })
hl.bind(key("CTRL + Q"), hl.dsp.exec_cmd("wlogout"), { description = "Logout menu" })
hl.bind(key("W"), hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper-grid.sh"), { description = "Choose wallpaper" })
hl.bind(key("SPACE"), hl.dsp.exec_cmd(menu), { description = "App launcher" })
hl.bind(key("SHIFT + B"), hl.dsp.exec_cmd("sh -c '~/.config/waybar/launch.sh; pkill swaync; swaync & pkill swayosd-server; swayosd-server &'"), { description = "Restart waybar, swaync and swayosd" })
hl.bind(key("SHIFT + K"), hl.dsp.exec_cmd("~/.config/hypr/scripts/keybindings.sh"), { description = "Show keybindings" })
hl.bind(key("E"), hl.dsp.exec_cmd("kitty " .. fileManager), { description = "File manager (yazi)" })
hl.bind(key("SHIFT + E"), hl.dsp.exec_cmd(fileManager2), { description = "File manager (thunar)" })
hl.bind(key("N"), hl.dsp.exec_cmd("~/.local/bin/hyprltm-net"), { description = "Network menu" })
hl.bind(key("C"), hl.dsp.exec_cmd("~/.config/hypr/scripts/cliphist.sh"), { description = "Clipboard history" }) -- Show clipboard history
hl.bind(key("I"), hl.dsp.exec_cmd("hyprsysteminfo"), { description = "System info" })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local k = i % 10 -- 10 maps to key 0
    hl.bind(key(k), hl.dsp.focus({ workspace = i }), { description = "Go to workspace " .. i })
    hl.bind(key("SHIFT + " .. k), hl.dsp.window.move({ workspace = i, follow = true }), { description = "Move window to workspace " .. i })
end

hl.bind(key("CTRL + left"), hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind(key("CTRL + right"), hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(key("mouse_down"), hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(key("mouse_up"), hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })

hl.bind(key("mouse:272"), hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(key("mouse:273"), hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Resizing
hl.bind(key("SHIFT + right"), hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Grow window width" })
hl.bind(key("SHIFT + left"), hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Shrink window width" })
hl.bind(key("SHIFT + up"), hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window height" })
hl.bind(key("SHIFT + down"), hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Grow window height" })

-- Brightness controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { repeating = true, description = "Brightness down" })

-- Audio controls
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { description = "Toggle mute" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { repeating = true, description = "Volume down" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { repeating = true, description = "Volume up" })

-- -----------------------------------------------------
-- Passthrough SUPER KEY to Virtual Machine
-- -----------------------------------------------------
-- hl.bind(key("P"), hl.dsp.submap("passthru"))
-- hl.define_submap("passthru", function()
--     hl.bind("SUPER + Escape", hl.dsp.submap("reset"))
-- end)
