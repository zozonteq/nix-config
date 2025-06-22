{
  lib,
  ...
}:
let
  common = import ../lib/common.nix { };
in
{
  home.homeDirectory = "/data/data/com.termux.nix/files/home";
  home.username = lib.mkForce "nix-on-droid";
  imports = common.commonCliModules;
}
