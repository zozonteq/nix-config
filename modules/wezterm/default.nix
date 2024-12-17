{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
  home.packages = with pkgs; [
    hackgen-nf-font
  ];
}
