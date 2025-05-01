{ pkgs, ... }:
{
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.typst-preview-nvim
    pkgs.vimPlugins.presence-nvim
    pkgs.vimPlugins.plenary-nvim
    pkgs.vimPlugins.nvim-dbee
  ];
}
