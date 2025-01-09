{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
    colorSchemes = builtins.fromTOML (builtins.readFile ./colors.toml);
  };
  home.packages = with pkgs; [
    hackgen-nf-font
  ];
}
