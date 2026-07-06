local wezterm = require("wezterm")
local config = {}

-- Use the config builder for better error message
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Appearance
config.color_scheme = "Catppuccin Mocha" -- One of the best for dev work
-- config.window_background_opacity = 0.90 -- Slightly transparent for that Linux look
config.enable_tab_bar = false

config.window_decorations = "NONE"

config.front_end = "WebGpu"

return config
