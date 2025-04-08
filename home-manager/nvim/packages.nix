{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    vscode-langservers-extracted
    tinymist
    cljfmt
    phpactor
    typescript
    typescript-language-server
    nodePackages.cspell
  ];
}