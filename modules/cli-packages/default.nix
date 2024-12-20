{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    live-server
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
    # utils
    yt-dlp
    # formatters
    nixfmt-rfc-style
    isort
    black
    stylua
    prettierd
    biome
  ];
  home.shellAliases = {
    "ls" = "eza --icons";
    "sl" = "eza --icons";
    "la" = "eza --icons -a";
    "al" = "eza --icons -a";
    "ll" = "eza --icons -l";
    "tree" = "eza --icons --tree";
    "lt" = "eza --icons --tree";
    "tl" = "eza --icons --tree";
    "grep" = "rg";
    "cat" = "bat";
    "cls" = "clear";
  };
}
