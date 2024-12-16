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
    bat
    eza
    ripgrep
    gcc
    cmake
  ];
  home.shellAliases = {
    "ls" = "eza --icons";
    "la" = "eza --icons -l";
  };
}
