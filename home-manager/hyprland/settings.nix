{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "GTK_IM_MODULE, fcitx5"
      "QT_IM_MODULE, fcitx5"
      "XMODIFIERS, @im=fcitx5"
    ];
    exec-once = [
      "fcitx5 -D"
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

  };
}
