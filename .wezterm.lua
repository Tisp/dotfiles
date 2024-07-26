-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12
-- config.color_scheme = "Batman"
config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.89
config.window_close_confirmation = "NeverPrompt"
return config
