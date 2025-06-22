{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "cursor"
    ];
  home.packages = with pkgs; [
    obs-studio
    code-cursor
  ];
}
