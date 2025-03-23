{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    stateVersion = 5;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      controlcenter = {
        BatteryShowPercentage = true;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        NewWindowTarget = "Home";
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        persistent-apps = [
          "/Applications/Firefox.app"
          "/Applications/Discord.app"
        ];
        slow-motion-allowed = false;
        tilesize = 48;

        wvous-bl-corner = 3;
        wvous-br-corner = 4;
        wvous-tl-corner = 2;
        wvous-tr-corner = 11;
      };
      screencapture = {
        disable-shadow = true;
        include-date = false;
        location = "~/Pictures/Screen";
      };
    };
  };

  homebrew = {
    enable = false;
    onActivation = {
      autoUpdate = true;
    };
    brews = [
      "meta-xr-simulator"
    ];
    taps = [
      "Oculus-VR/tap"
    ];
    casks = [
      "firefox"
      "raycast"
      "obsidian"
      "notion"
      "discord"
      "spotify"
      "blender"
      "arduino-ide"
      "bitwarden"
      "android-studio"
      "keycastr"
      "alt-tab"
      "processing"
      "flutter"
      "zed"
      "xpipe"
    ];
  };

}
