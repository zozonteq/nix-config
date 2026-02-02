
{
  lib,
  config,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "x1";
  users.users.user = {
    packages = with pkgs; [ ];
  };
  services = {
    xserver.desktopManager.gnome.enable = true;
  };
  imports = [
    ./hardware.nix
  ];
}
