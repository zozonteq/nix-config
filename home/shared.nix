{
  ...
}:
let
  username = "user";
in
{
  imports = [ ../modules/default.nix ];
  nixpkgs = {
    config.allowUnFree = true;
  };
  home = {
    username = username;
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
