{ pkgs, ... }:
let
  Matugen_Themes_Dir = ".config/matugen-themes";
in
{
  home.packages = with pkgs; [
    matugen
  ];
  home.file = {
    ".config/matugen/config.toml".text = ''
      [config.wallpaper]
      command = "swww"
      arguments = ["img", "--transition-type", "center"]
      set = false 
      [templates.hyprland]
      input_path = "~/${Matugen_Themes_Dir}/templates/hyprland-colors.conf"
      output_path = "~/.config/hypr/colors.conf"
      post_hook = "hyprctl reload"
      [templates.kitty]
      input_path = "~/${Matugen_Themes_Dir}/templates/kitty-colors.conf"
      output_path = "~/.config/kitty/colors.conf"
      post_hook = "kill -SIGUSR1 $(pidof kitty)"
    '';

    "${Matugen_Themes_Dir}/".source = fetchGit {
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
