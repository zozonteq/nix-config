{
  pkgs,
  config,
  ...
}:
{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  # location
  time.timeZone = "Asia/Tokyo";
  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
    defaultLocale = "ja_JP.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
  };
  fonts = {
    fonts = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      hackgen-nf-font
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
        ];
        monospace = [
          "HackGen Console NF"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

  };

  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  services.xserver.enable = true;
  services.displayManager.ly.enable = true;

  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      kitty
    ];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
