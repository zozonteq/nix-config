{ ... }:
{
  programs.home-manager.enable = true;
  imports = [
    ./wallpaper.nix
    ./kitty
    ./ghostty
    ./cli-packages
  ];
}
