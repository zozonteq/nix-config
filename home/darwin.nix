{ ... }:
{
  home.homeDirectory = "/Users/user";
  imports = [
    ../home-manager/cli-packages
    ../home-manager/nvim
    ../home-manager/zsh
    ../home-manager/git
    ../home-manager/ollama
    ../home-manager/lima.nix
    # ../home-manager/docker.nix
    ../home-manager/nix-direnv.nix
  ];
  home.sessionPath = [
    "/opt/homebrew/bin"
    "$PATH"
  ];
}
