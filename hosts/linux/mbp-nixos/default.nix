{ lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "mbp-nixos";
  programs = {
    steam.enable = true;
  };
  imports = [
    ./hardware.nix
  ];
  boot.kernelParams = [
    "mem_sleep_default=s2idle"
    "no_console_suspend"
  ];

  systemd.services.suspend-fix-t2 = {
    enable = true;
    description = "Workaround for suspend on t2 macbook";
    before = [ "sleep.target" ];
    unitConfig = {
      StopWhenUnneeded = true;
    };
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      RemainAfterExit = true;
      ExecStart = [
        "/run/current-system/sw/bin/sh -c \"echo 0 > /sys/power/pm_async\""
        "/run/current-system/sw/bin/modprobe -r brcmfmac_wcc"
        "/run/current-system/sw/bin/modprobe -r brcmfmac"
        #"/run/current-system/sw/bin/rmmod -f apple-bce"
      ];
      ExecStop = [
        #"/run/current-system/sw/bin/modprobe apple-bce"
        "/run/current-system/sw/bin/modprobe brcmfmac"
        "/run/current-system/sw/bin/modprobe brcmfmac_wcc"
      ];
    };
    wantedBy = [ "sleep.target" ];
  };
}
