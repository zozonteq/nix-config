{
  ...
}:
let
  username = "user";
in
{
  imports = [ ../home-manager/default.nix ];
  nixpkgs = {
    config.allowUnFree = true;
  };
  home = {
    username = username;
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
