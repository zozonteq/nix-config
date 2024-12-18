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
    "la" = "eza --icons -l";
  };
}
