{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ../modules/gui
    ../home-manager/hyprland
  ];
}
