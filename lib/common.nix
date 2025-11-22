# 共通設定とユーティリティ関数
{ ... }:

let
  # システム定義
  systems = {
    x86_64-linux = "x86_64-linux";
    aarch64-linux = "aarch64-linux";
    x86_64-darwin = "x86_64-darwin";
    aarch64-darwin = "aarch64-darwin";
  };

  # 共通のNix設定
  commonNixSettings = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # 共通のHome設定
  commonHomeSettings =
    { username }:
    {
      home = {
        inherit username;
        stateVersion = "24.11";
      };
      programs.home-manager.enable = true;
      nixpkgs.config.allowUnfree = true;
    };

  # 共通のCLIパッケージ
  commonCliModules = [
    ../home-manager/cli-packages
    ../home-manager/nvim
    ../home-manager/zsh
    ../home-manager/git
    ../home-manager/tmux
  ];

  # デスクトップ用の追加モジュール
  desktopModules = [
    ../home-manager/gui
    ../home-manager/hyprland
    ../home-manager/barrier.nix
  ];

  # Darwin用の追加モジュール
  darwinModules = [
    ../home-manager/ollama
    ../home-manager/lima.nix
    ../home-manager/nix-direnv.nix
  ];

in
{
  inherit
    systems
    commonNixSettings
    commonHomeSettings
    commonCliModules
    desktopModules
    darwinModules
    ;
}
