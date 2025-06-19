{ lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "elitedesk";
  programs = {
    steam.enable = true;
  };
  imports = [
    ./hardware.nix
  ];
}
