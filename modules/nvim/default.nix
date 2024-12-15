{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      # todo: vimの入れ子にしたかった...
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        null-ls.enable = true;
        lspkind.enable = true;
      };
      vim.autocomplete.nvim-cmp = {
        enable = true;
      };
      vim.ui = {
        noice.enable = true;
        colorizer.enable = true;
        breadcrumbs = {
          enable = true;
          lualine.winbar.enable = true;
          lualine.winbar.alwaysRender = true;
        };
      };
      vim.statusline.lualine = {
        enable = true;
        theme = "iceberg";
      };
      vim.tabline.nvimBufferline.enable = true;
      vim.languages = {
        enableFormat = true; # enable formatting for languages
        enableLSP = true;
        enableTreesitter = true;
        rust.enable = true;
        nix = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        ts = {
          enable = true;
          extensions.ts-error-translator.enable = true;
          format.type = "prettier";
        };
        clang.enable = true;
        python.enable = true;
        html.enable = true;
        bash.enable = true;
        lua.enable = true;
      };
      vim.useSystemClipboard = true;
      vim.telescope.enable = true;
      vim.startPlugins = with pkgs.vimPlugins; [
        nvim-treesitter
        vim-wakatime
        nvim-autopairs
      ];
      vim.lazy.plugins = with pkgs.vimPlugins; {
        "iceberg.vim" = {
          package = iceberg-vim;
          lazy = true;
          event = ["VimEnter"];
        };
        "aerial.nvim" = {
          package = aerial-nvim;
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
