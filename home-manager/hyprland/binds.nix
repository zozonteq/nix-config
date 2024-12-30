{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, T, exec, wezterm"
      "$mainMod, Delete, exit,"
      "$mainMod, Q , killactive,"
      "$mainMod, Space, exec, rofi -show run"
    ];
  };
}
