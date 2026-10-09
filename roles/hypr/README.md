# hypr

A Hyprland desktop for Fedora, built from the Hyprland ecosystem plus waybar,
rofi and swaync. It uses the Nordic Mist colors throughout. The Hyprland config
is written in Lua (Hyprland 0.55+).

## What's in it

| Part | Tool | Notes |
|------|------|-------|
| Compositor | Hyprland | Lua config in `files/hypr/hyprland.lua` and `files/hypr/conf/` |
| Bar | waybar | Rounded pills. The logo opens a control center menu |
| Launcher and menus | rofi | App launcher, wallpaper grid, clipboard, emoji and settings, all in one shared style |
| Notifications | swaync | Panel with volume slider, Wi-Fi and Bluetooth tiles, quick toggles and a media card |
| Lock and idle | hyprlock, hypridle | Dim, lock, screen off and suspend times are set in the settings menu |
| Wallpaper | hyprpaper | Grid picker on Alt+W. Wallpapers live in `~/Pictures/Wallpapers` |
| Night light | hyprsunset | |
| On-screen display | swayosd | Volume, brightness and media keys |
| Logout | wlogout | 2x2 power menu |
| Screenshots | hyprshot, satty | |
| Network and Bluetooth | hyprltm-net, bluetui | |

## Settings menu

Alt+Shift+S opens a rofi menu that changes the desktop live. It has these
pages:

- Display
- Appearance
- Status bar
- Keyboard and mouse
- Power and idle
- Notifications
- Network, sound and bluetooth
- System

Your choices are stored in `~/.local/state/hypr/`, outside the files the role
manages, so running the role again does not reset them. Every page has a
"Reset to defaults" entry.

## Key bindings

The modifier is Alt. Alt+Shift+K shows the full list.

| Keys | Action |
|------|--------|
| Alt+Enter | Terminal (kitty) |
| Alt+Space | App launcher |
| Alt+Shift+Q | Close window |
| Alt+F / Alt+Shift+F | Fullscreen / floating |
| Alt+Tab / Alt+Shift+Tab | Next / previous window |
| Alt+1..0 / Alt+Shift+1..0 | Go to / move window to workspace |
| Alt+H/J/K/L or arrows | Move focus |
| Alt+E / Alt+Shift+E | File manager (yazi / thunar) |
| Alt+B | Browser |
| Alt+C | Clipboard history |
| Alt+. | Emoji picker |
| Alt+N | Network menu |
| Alt+W | Wallpaper picker |
| Alt+P or Alt+Print | Screenshot |
| Alt+Shift+S | Settings |
| Alt+Ctrl+L | Lock screen |
| Alt+Ctrl+Q | Logout menu |
| Alt+Shift+B | Restart waybar, swaync and swayosd |

## Install

From the repository root:

```bash
./bin/dotfiles --ask-become-pass --tags hypr
```

The role does the following:

- Enables following copr repositories:
    - `lionheartp/Hyprland`
    - `erikreider/swayosd`
    - `lihaohong/yazi`
- Installs the packages, including `waybar-git`, which replaces `waybar`.
- Builds bluetui with cargo.
- Downloads the Bibata cursor theme.
- Syncs `files/` to `~/.config`.

## Requirements

- Fedora, since the role uses dnf5 and copr.
- A Nerd Font. The `nerdfonts` role installs JetBrains Mono.
- kitty, from the `kitty` role.

## Layout

| Path | Contents |
|------|----------|
| `files/hypr/` | Hyprland, hyprlock, hypridle and hyprpaper config, plus scripts |
| `files/waybar/` | Bar config, modules, style and control center menu |
| `files/rofi/` | Shared theme and one config per menu |
| `files/swaync/` | Notification center config, style and toggle scripts |
| `files/wallpaper/` | Wallpapers, copied to `~/Pictures/Wallpapers` |
| `defaults/main.yml` | Bibata cursor version |
| `tasks/main.yml` | Packages, repos and file sync |
