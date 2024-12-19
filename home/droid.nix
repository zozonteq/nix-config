{ pkgs, nixvim,lib, ... }:
{
home.homeDirectory = "/data/data/com.termux.nix/files/home";
home.username = lib.mkForce "nix-on-droid";


}
