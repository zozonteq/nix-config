{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      username = {
        disabled = false;
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };
    };
  };
}
