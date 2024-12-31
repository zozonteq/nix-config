{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, T, exec, kitty"
      "$mainMod, Delete, exit,"
      "$mainMod, Q , killactive,"
      "$mainMod, Space, exec, rofi -show run"
    ];
  };
}
