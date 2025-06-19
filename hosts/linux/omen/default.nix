{ lib, config, ... }:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "omen";

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = true;
    # powerManagement.finegrained = true;
    nvidiaSettings = true;
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  programs.steam = {
    enable = true;
  };
  imports = [
    ./hardware.nix
  ];
}
