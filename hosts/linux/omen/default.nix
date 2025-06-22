{
  lib,
  config,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "omen";

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = true;
    # powerManagement.finegrained = true;
    nvidiaSettings = true;
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  users.users.user = {
    packages = with pkgs; [
      ollama-cuda
    ];

  };
  services = {
    xserver.desktopManager.gnome.enable = true;
  };
  # services.open-webui.enable = true;
  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";
  imports = [
    ./hardware.nix
  ];
}
