{ config, pkgs, ... }:

let
  tmuxPowerline = pkgs.tmuxPlugins.tmux-powerline;

  catppuccin-tmux-powerline = pkgs.fetchFromGitHub {
    owner = "kjnsn";
    repo = "catppuccin-tmux-powerline";
    rev = "main";
    sha256 = "sha256-vablRo9Dqs97CRF7dO1swFi2vKg6rdTCfLU0wyERaCA";
  };
in
{
  home.packages = with pkgs; [
    gawk
    jq
  ];

  # ユーザテーマ置き場（tmux-powerline が見るディレクトリ）
  # ~/.config/tmux-powerline/themes/catppuccin_mocha_theme.sh などが置かれる
  home.file.".config/tmux-powerline/themes".source = catppuccin-tmux-powerline;

  # tmux-powerline 用の config.sh
  home.file.".config/tmux-powerline/config.sh".text = ''
    # ユーザテーマディレクトリ
    TMUX_POWERLINE_DIR_USER_THEMES="~/.config/tmux-powerline/themes"

    # catppuccin mocha テーマを使用
    TMUX_POWERLINE_THEME="catppuccin_mocha_theme"

    # デバッグを一時的に有効化（原因調査用）
    TMUX_POWERLINE_DEBUG_MODE_ENABLED="true"
  '';

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    clock24 = true;
    mouse = true;

    plugins = [
      {
        plugin = tmuxPowerline;
        # main.tmux の run-shell は plugin 側が自動で追加してくれるので
        # ここでは extraConfig は不要
      }
    ];

    extraConfig = ''
      set -g default-terminal "screen-256color"
    '';
  };
}
