{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./nvim
    ./zsh
    ./cli-packages
    ./git
  ];
}
