local wezterm = require("wezterm")

function GetHostname()
	local f = io.popen("hostname")
	local hostname = f:read("*a") or ""
	f:close()
	hostname = string.gsub(hostname, "\n$", "")
	print(hostname)
	return hostname
end

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

local config = wezterm.config_builder()

config.color_scheme = "cyberdream"
config.font = wezterm.font("HackGen Console NF")

config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

if is_linux() then
	config.front_end = "WebGpu"
	config.enable_wayland = false
end

if is_darwin() then
	print("Darwin!")
	config.macos_window_background_blur = 30

	-- https://github.com/NixOS/nixpkgs/issues/336069
	config.front_end = "WebGpu"
end

-- device specific
if GetHostname() == "mac2" then
	config.font_size = 18.0
end

return config
