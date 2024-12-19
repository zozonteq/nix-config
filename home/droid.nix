{ pkgs, nixvim, ... }:
{
  home-manager.config =
    { pkgs, ... }:
    {
      modules = [ nixvim.homeManagerModules.default ];
      imports = [

        nixvim.homeManagerModules.default
        ../modules/default.nix
      ];
      home.stateVersion = "24.05";
      nixpkgs = {
        config.allowUnFree = true;
      };
    };
}
