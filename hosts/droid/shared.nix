{ nixvim, ... }:
{
  system.stateVersion = "24.05";
  nix.extraOptions = "experimental-features = nix-command flakes";
}
