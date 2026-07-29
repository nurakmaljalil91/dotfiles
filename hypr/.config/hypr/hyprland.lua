-- Draft translation of ~/.config/hypr/hyprland.conf -> hyprland.lua
-- Generated for review, not yet installed. Check every "-- VERIFY" line
-- against the wiki (https://wiki.hypr.land/Configuring/Basics/Dispatchers/)
-- or `hyprctl repl` before relying on it.

------------------
---- ENV VARS ----
------------------
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("LIBVA_DRM_DEVICE", "/dev/dri/renderD129")
-- hl.env("NVD_BACKEND", "direct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots")

------------------
---- MONITOR -----
------------------
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

------------------
---- PROGRAMS ----
------------------
local mainMod        = "SUPER"
local terminal        = "wezterm"
local fileManager     = "thunar"
local menu            = "rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-1.rasi"
local browser         = "google-chrome-stable"
local lockSession     = "sh -c 'if command -v hyprlock >/dev/null 2>&1; then hyprlock; elif command -v swaylock >/dev/null 2>&1; then swaylock; else loginctl lock-session; fi'"
local randomWallpaper = "~/.local/bin/random_wall.sh"

------------------
---- GENERAL -----
------------------
hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        touchpad = { natural_scroll = true },
    },

    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
        allow_tearing = false, -- helps with flickering on Nvidia
    },

    decoration = {
        rounding = 10,
        shadow = { enabled = false }, -- can cause gray boxes on hybrid graphics
        blur = { enabled = false, size = 3, passes = 1 }, -- false to stop workspace flickering
    },

    animations = { enabled = true },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4,  bezier = "default", style = "slide" })

---------------------
---- KEYBINDINGS ----
---------------------
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(lockSession))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + ALT + W",  hl.dsp.exec_cmd(randomWallpaper))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("~/.local/bin/wall_menu.sh"))

-- Screenshots
hl.bind("Print",                  hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + Print",       hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- Focus movement (confirmed pattern from official example)
local dirKeys = { H = "left", L = "right", K = "up", J = "down" }
for key, dir in pairs(dirKeys) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }))
end
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- VERIFY: swapwindow's Lua form isn't shown in Hyprland's official example.
-- Try in a terminal: `hyprctl repl` then `hl.dsp.window` to inspect available
-- fields, or check the live wiki Dispatchers page. Best guess below:
for key, dir in pairs(dirKeys) do
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.swap({ direction = dir })) -- VERIFY
end
hl.bind(mainMod .. " + CONTROL + left",  hl.dsp.window.swap({ direction = "left" }))  -- VERIFY
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.window.swap({ direction = "right" })) -- VERIFY
hl.bind(mainMod .. " + CONTROL + up",    hl.dsp.window.swap({ direction = "up" }))    -- VERIFY
hl.bind(mainMod .. " + CONTROL + down",  hl.dsp.window.swap({ direction = "down" }))  -- VERIFY

-- Workspaces 1-10 + move window to workspace (confirmed pattern)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
for i = 1, 4 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Relative workspace switch (confirmed pattern: focus({workspace = "e+1"}))
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))

-- Clipboard
hl.bind("CONTROL + ALT + V", hl.dsp.exec_cmd(
    "cliphist list | rofi -dmenu -theme ~/.config/rofi/launchers/type-1/style-1.rasi | cliphist decode | wl-copy"))

-- Media / brightness keys (locked+repeating mirrors old bindel behavior,
-- confirmed pattern from official example)
hl.bind("F3", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { locked = true, repeating = true })
hl.bind("F4", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true })
hl.bind("F5", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("F6", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true, repeating = true })
hl.bind("F7", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("F8", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true })
hl.bind("F10", hl.dsp.exec_cmd("wtype -k insert"), { locked = true })
hl.bind("F11", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/airplane_mode.sh"), { locked = true })
hl.bind("F12", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/airplane_mode.sh"), { locked = true })

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img /usr/share/wallpapers/cachyos-wallpapers/CachyOS_GreenSpace.png")
    hl.exec_cmd("~/.config/eww/launch.sh")
end)
