{ nixvim, ... }:
{
  system.stateVersion = "24.05";
  nix.extraOptions = "experimental-features = nix-command flakes";
  home-manager.config =
    { pkgs, ... }:
    {
      home.stateVersion = "24.05";
      imports = [ ../../modules/default.nix ];
      nixpkgs = {
        config.allowUnFree = true;
      };
    };
}
