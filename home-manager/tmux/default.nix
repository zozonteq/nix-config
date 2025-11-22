{
  config,
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    plugins = with pkgs; [
      tmuxPLugins.better-mouse-mode
    ];
  };

}
