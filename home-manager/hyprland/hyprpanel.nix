{ pkgs, inputs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
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
    matugen
    swww
  ];
  home.file = {
    ".config/hyprpanel/config.json".text = builtins.toJSON {
      "theme.bar.floating" = false;
      "theme.font.name" = "HackGen35 Console NF";
      "theme.font.label" = "HackGen35 Console NF Bold";
      "theme.font.size" = "1rem";
      "theme.matugen" = true;
      "wallpaper.enable" = true;
      "wallpaper.image" = "~/wallpapers/cyber.png";
    };
    ".config/matugen/config.toml".text = ''
      [config.wallpaper]
      command = "swww"
      arguments = ["img", "--transition-type", "center"]
      set = true
      [templates.hyprland]
      input_path = "~/.config/matugen/colors.css"
      output_path = "~/.config/hypr/colors.conf"
      post_hook = "hyprctl reload"
    '';
    ".config/matugen/matugen-themes".source = fetchGit {
      url = "https://github.com/InioX/matugen-themes";
      rev = "e654163b51c75798cbcdfe5aa7c07dbc51614b0f";
    };
    ".config/matugen/colors.css".text = ''
      <* for name, value in colors *>
      @define-color {{name}} {{value.default.hex}};
      <* endfor *>
    '';

  };
}
