{ ... }:
let
  common = import ../lib/common.nix { };
in
{
  nixpkgs.config.allowUnfree = true;
  nix = common.commonNixSettings;
}
