local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.color_scheme = "iceberg-dark"
config.font = wezterm.font("HackGen Console NF")

config.window_background_opacity = 0.5
-- config.macos_window_background_blur = 0

-- https://github.com/NixOS/nixpkgs/issues/336069
config.front_end = "WebGpu"

return config
