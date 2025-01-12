{ lib, ... }:{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "elitedesk";
  imports = [
    ./hardware.nix
  ];
}
