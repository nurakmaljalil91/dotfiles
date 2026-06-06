local wezterm = require("wezterm")
local config = {}

-- Use the config builder for better error message
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font & Ligatures
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 12.0
config.line_height = 1.1

-- Appearance
config.color_scheme = "Catppuccin Mocha" -- One of the best for dev work
config.window_background_opacity = 0.90 -- Slightly transparent for that Linux look
config.hide_tab_bar_if_only_one_tab = true -- Performance

config.window_decorations = "RESIZE"

config.front_end = "WebGpu"

return config
