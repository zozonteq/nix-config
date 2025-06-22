{
  ...
}:
let
  username = "user";
  common = import ../lib/common.nix { };
in
common.commonHomeSettings { inherit username; }
