{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    fzf
    peco
    unzip
    fastfetch
    htop
    screen
    bat
    ripgrep
    eza
    # developer env
    python3
    bun
    gcc
    cmake
    lua
    # dev tools
    live-server
    android-tools
    tmux
    # utils
    ffmpeg
    yt-dlp
    typst
    pandoc
    scrcpy
    # formatters
    nixfmt-rfc-style # nix formatter
    isort # formatter for python
    black # formatter for python
    stylua # formatter for lua
    prettierd # formatter for web dev
    biome # formatter for web dev
    hackgen-nf-font
    fontconfig
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
