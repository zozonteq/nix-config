{ ... }:
{
  programs.nixvim.opts = {
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    number = true;
    relativenumber = true;
    autoindent = true;
    scrolloff = 5;
    swapfile = false;
    backup = false;
    writebackup = false;
  };
}