{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
      vim.useSystemClipboard = true;
      vim.startPlugins = with pkgs.vimPlugins;[ 
        nvim-treesitter
        telescope-nvim
        catppuccin-nvim
        vim-wakatime
      ];
      vim.lazy.plugins = {
        "aerial.nvim" = {
          package = pkgs.vimPlugins.aerial-nvim;
          setupModule = "aerial";
          setupOpts = {
            option_name = true;
          };
          lazy = true;
          cmd = ["AerualOpen"];
          event = ["BufEnter"];

          keys = [
            {
              key = "<leader>a";
              action = ":AerialToggle<CR>";
              mode = "";
            }
          ];
        };
      };
    };
  };
}
