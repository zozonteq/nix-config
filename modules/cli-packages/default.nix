{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    fzf
    ffmpeg
    peco
    unzip
    fastfetch
    htop
    screen
    python3
    bun
  ];
}
