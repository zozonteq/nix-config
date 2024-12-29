{ pkgs, ... }:
{
  home.homeDirectory = "/home/user";
  home.packages = [ pkgs.cowsay ];
}
