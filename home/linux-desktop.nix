{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ../modules/gui
  ];
}
