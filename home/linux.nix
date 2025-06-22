{ ... }:
let
  common = import ../lib/common.nix { };
in
{
  home.homeDirectory = "/home/user";
  imports = common.commonCliModules;
}
