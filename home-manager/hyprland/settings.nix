{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    source = [
      "colors.conf"
    ];
    env = [
      "GTK_IM_MODULE, fcitx5"
      "QT_IM_MODULE, fcitx5"
      "XMODIFIERS, @im=fcitx5"
    ];
    exec-once = [
      "fcitx5 -D"
      "hyprpanel sw ~/wallpapers/cyber.png"
      "${pkgs.hyprpanel}/bin/hyprpanel"
    ];
    decoration = {
      rounding = 5;
    };
    input = {
      kb_layout = "jp";
    };
    monitor = [
      ",prefered,auto,1"
    ];
    general = {
      "col.active_border" = [
        "$on_primary $on_secondary 45deg"
      ];
    };

  };
}
