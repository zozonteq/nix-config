local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "cyberdream"
config.font = wezterm.font("HackGen Console NF")

config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.macos_window_background_blur = 30

-- https://github.com/NixOS/nixpkgs/issues/336069
config.front_end = "WebGpu"

return config
