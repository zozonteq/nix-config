{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker
    docker-compose
    colima
  ];
}
