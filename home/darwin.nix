{ ... }:
{
  home.homeDirectory = "/Users/user";
  imports = [
    ../home-manager/cli-packages
    ../home-manager/nvim
    ../home-manager/zsh
    ../home-manager/git
    ../home-manager/ollama
  ];
}
