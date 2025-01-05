{ pkgs, inputs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
    ./matugen.nix
  ];
  programs.ags = {
    enable = true;
  };
  home.packages = with pkgs; [
    hyprpanel
    hyprpaper
    libgtop
    bluez
    #bluez-utils
    networkmanager
    dart-sass
    wl-clipboard
    btop
    brightnessctl
    swww
    upower
  ];
  home.file = {
    ".config/hyprpanel/config.json".text = builtins.toJSON {
      "theme.bar.floating" = false;
      #"theme.font.name" = "HackGen35 Console NF";
      "theme.font.name" = "Monocraft Nerd Font";
      #"theme.font.label" = "HackGen35 Console NF Bold";
      "theme.font.label" = "Monocraft Nerd Font";
      "theme.font.size" = "1rem";
      "theme.matugen" = true;
      "wallpaper.enable" = true;
      "wallpaper.image" = "~/wallpapers/cyber.png";
    };
  };
}
