{ ... }:
let
  common = import ../lib/common.nix { };
in
{
  imports = common.desktopModules;
}
