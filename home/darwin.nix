{ ... }:
let
  common = import ../lib/common.nix { };
in
{
  home.homeDirectory = "/Users/user";
  imports = common.commonCliModules ++ common.darwinModules;
  home.sessionPath = [
    "/opt/homebrew/bin"
    "$PATH"
  ];
}
