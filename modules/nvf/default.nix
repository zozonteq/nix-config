{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };
        viAlias = true;
        vimAlias = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          null-ls.enable = true;
        };
        autocomplete.nvim-cmp = {
          enable = true;
        };
        filetree.nvimTree.enable = true;
        visuals = {
          indentBlankline.enable = true;
        };
        utility = {
          preview = {
            markdownPreview = {
              enable = true;
              autoStart = true;
              autoClose = true;
            };
          };
        };
        ui = {
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            lualine.winbar.enable = true;
            lualine.winbar.alwaysRender = true;
            alwaysRender = true;
          };
        };
        statusline.lualine = {
          enable = true;
        };
        autopairs.nvim-autopairs.enable = true;
        tabline.nvimBufferline.enable = true;
        languages = {
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
        useSystemClipboard = true;
        telescope.enable = true;
        startPlugins = with pkgs.vimPlugins; [
          nvim-treesitter
          vim-wakatime
          nvim-autopairs
        ];
        lazy.plugins = with pkgs.vimPlugins; {
          "catppuccin-nvim" = {
            package = catppuccin-nvim;
            lazy = true;
            event = ["VimEnter"];
            after = ''
              vim.cmd("colorscheme catppuccin-macchiato")
            '';
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
  };
}
