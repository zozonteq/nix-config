{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, T, exec, kitty -o allow_remote_control=yes -o enabled_layouts=tall"
      "$mainMod, Delete, exit,"
      "$mainMod, Q , killactive,"
      "$mainMod, Space, exec, rofi -show run"
      "$mainMod, H, workspace, -1"
      "$mainMod, L, workspace, +1"
      "$mainMod, Tab, exec, hyprctl dispatch focus_prev"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%-"
    ];
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resiewindow"
    ];
  };
}
