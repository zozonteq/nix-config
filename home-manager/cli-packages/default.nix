{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # cli tools
    fzf # ファジーファインダ
    peco
    unzip
    fastfetch
    htop
    screen
    bat
    ripgrep
    eza
    fd
    btop
    duf
    tldr
    wget
    tmux
    imgcat
    lsix

    # developing env
    python3
    bun
    deno
    # c
    gcc
    cmake
    # lua
    lua
    # lisp(clojure)
    clojure
    leiningen

    # php
    php83
    php83Packages.composer
    php83Packages.php-cs-fixer
    laravel

    # dev tools
    live-server
    android-tools # ADB, fastboot ...

    # utils
    ffmpeg
    yt-dlp
    typst # 組版エンジン
    pandoc # ドキュメント変換ツール
    scrcpy # ADB経由でAndroid端末を操作できる
    p7zip # 7zip
    w3m # cli web browser

    # formatters
    nixfmt-rfc-style # nix
    isort # python
    black # python
    stylua # lua
    prettierd # webdev(JS,TS,HTML,CSS)
    biome # webdev(JS,TS,HTML,CSS)
    php83Packages.php-codesniffer

    # font
    hackgen-nf-font
    fontconfig

    # cf
    cloudflared
  ];

  home.shellAliases = {
    "l" = "eza --icons always";
    "ls" = "eza --icons always";
    "sl" = "eza --icons always";
    "la" = "eza --icons -a ";
    "al" = "eza --icons -a";
    "ll" = "eza --icons -l";
    "tree" = "eza --icons --tree";
    "lt" = "eza --icons --tree";
    "tl" = "eza --icons --tree";
    "grep" = "rg";
    "cls" = "clear";
    "v" = "nvim";
    "fz" = "fzf";
    "xa" = "xargs";
    "fzv" = "fzf | xargs vim";
    "find" = "fd";
  };
  home.file.".config/direnv/direnv.toml".text = ''
    [global]
    # https://direnv.net/man/direnv.toml.1.html
    hide_env_diff = true
  '';
}
