{ ... }:
{
  programs.home-manager.enable = true;
  imports = [
    ./wallpaper.nix
    ./ghostty
    ./cli-packages
    ./nvim
    ./wezterm
    ./git
    ./zsh
  ];
}
