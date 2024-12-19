{ pkgs, ... }:
{
  home-manager.config =
    { pkgs, ... }:
    {
      imports = [ ../modules/default.nix ];
      home.stateVersion = "24.05";
      nixpkgs = {
        config.allowUnFree = true;
      };
    };
}
