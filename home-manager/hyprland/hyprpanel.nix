{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpanel
    libgtop
    bluez
    #bluez-utils
    networkmanager
    dart-sass
    wl-clipboard
    btop
    brightnessctl
  ];
}
