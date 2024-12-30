{ pkgs, ... }:
{
  imports = [
    ./settings.nix
    ./binds.nix
    ./hyprpanel.nix
    ./rofi.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
