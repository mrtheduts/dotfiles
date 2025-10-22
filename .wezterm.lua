-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

--  Fonts
config.font_size = 12
config.font = wezterm.font "RobotoMono Nerd Font"
config.color_scheme = 'Catppuccin Latte'
config.window_background_opacity = 0.85

-- Finally, return the configuration to wezterm:
return config
