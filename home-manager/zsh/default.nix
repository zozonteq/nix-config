{
  config,
  pkgs,
  ...
}:
{
  home.sessionVariables = {
    HELLO = "hello";
  };
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [ "completion" ];
    };
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    plugins = [
      {
        name = "zsh-autopairs";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopairs";
          rev = "449a7c3d095bc8f3d78cf37b9549f8bb4c383f3d";
          sha256 = "1x16y24hbwcaxfhqabw4x26jmpxzz2zzmlvs9nnbzaxyi20cwfyz";
        };
      }
    ];
    initExtra = ''
      ccr(){
        gcc $1;./a.out
      }
      r#(){
         if [[$1 == r#*]]; then
           cmd = "nix run nixpkgs#$\{1:2\}"
           eval $cmd
         else
           echo "invalid command"
         fi
      }
    '';
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
