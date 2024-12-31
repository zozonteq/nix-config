{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, T, exec, kitty -o allow_remote_control=yes -o enabled_layouts=tall"
      "$mainMod, Delete, exit,"
      "$mainMod, Q , killactive,"
      "$mainMod, Space, exec, rofi -show run"
    ];
  };
}
