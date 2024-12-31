{ home-manager, inputs, ... }:
{
  programs.home-manager.enable = true;
  imports = [
    ./wallpaper.nix
  ];
}
