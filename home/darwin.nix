{ pkgs, ... }:
{
  home.homeDirectory = "/Users/user";
  home.packages = [ pkgs.cowsay ];
}
