{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      dynamic_background_operacity = true;
      background_opacity = 0.94;
      include = "colors.conf";
    };
  };
}
