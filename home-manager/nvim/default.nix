{ ... }:
{
  imports = [
    ./packages.nix
    ./globals.nix
    ./keymaps.nix
    ./opts.nix
    ./plugins.nix
    ./extraPlugins.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    clipboard = {
      register = "unnamedplus";
    };
  };
}
