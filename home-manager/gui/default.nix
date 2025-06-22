{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "cursor"
      "spotify"
    ];
  home.packages = with pkgs; [
    obs-studio
    code-cursor
    spotify
    discord
    slack
    obsidian
    
  ];
}
