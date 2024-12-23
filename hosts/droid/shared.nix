{ pkgs, nixvim, ... }:
{
  system.stateVersion = "24.05";
  nix.extraOptions = "experimental-features = nix-command flakes";
  terminal = {
    font = "${pkgs.hackgen-nf-font}/share/fonts/hackgen-nf/HackGenConsoleNF-Regular.ttf";
  };
}
