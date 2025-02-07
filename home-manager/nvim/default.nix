{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    vscode-langservers-extracted
    tinymist
    cljfmt
    phpactor
    typescript
    typescript-language-server
  ];
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        key = "gn";
      }
    ];
    opts = {
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
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    clipboard = {
      register = "unnamedplus";
    };
    colorschemes.cyberdream.enable = true;
    plugins = {
      # lazy loader
      lz-n = {
        enable = true;
      };
      wakatime = {
        enable = true;
      };
      presence-nvim = {
        enable = true;
      };
      # statusbar
      lualine = {
        enable = true;
      };
      # bufferbar
      bufferline = {
        enable = true;
      };
      # winbar
      barbecue = {
        enable = true;
        settings = {
        };
      };
      # better scrolling
      neoscroll = {
        enable = true;
        settings = {
          easing = "sine";
        };
        lazyLoad = {
          settings = {
            event = "BufEnter";
          };
        };
      };
      oil = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
      };
      # icons
      web-devicons = {
        enable = true;
      };
      # terminal
      toggleterm = {
        enable = true;
        lazyLoad = {
          settings = {
            cmd = "ToggleTerm";
            keys = [
              "<c-t>"
            ];
          };
        };
      };
      transparent = {
        enable = true;
      };

      nvim-autopairs = {
        enable = true;
        lazyLoad = {
          settings = {
            enable = true;
          };
        };
      };
      ollama = {
        enable = true;
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          incremental_selection.enable = true;
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<C-p>" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
      diffview = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
      };
      # cmp
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
      noice = {
        enable = true;
      };
      typst-vim = {
        enable = true;
      };
      # formatter
      # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            python = [
              "isort"
              "black"
            ];
            nix = [ "nixfmt" ];
            typescript = [
              "biome"
              "prettierd"
            ];
            javascript = [
              "biome"
              "prettierd"
            ];
            jsx = [
              "biome"
              "prettierd"
            ];
            html = [
              "biome"
              "prettierd"
              "fallback"
            ];
            clojure = [
              "cljfmt"
            ];
            php = [
              "php_cs_fixer"
            ];
          };
          format_on_save = {
            timeout_ms = 5000;
            lsp_format = "fallback";
          };
          default_format_opts = {
            lsp_format = "fallback";
          };
        };
      };
      emmet = {
        enable = false;
      };
      # laugnages
      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          #denols.enable = true;
          nil_ls.enable = true;
          clangd.enable = true;
          pylsp.enable = true;
          bashls.enable = true;
          emmet_language_server.enable = true;
          tailwindcss.enable = true;
          cssls.enable = true;
          html.enable = true;
          dockerls.enable = true;
          tinymist.enable = true;
          lua_ls.enable = true;
          clojure_lsp.enable = true;
          phpactor.enable = true;
          eslint = {
            enable = true;
          };
        };
      };
      lint = {
        enable = false;
        lintersByFt = { };
      };
      typescript-tools = {
        enable = true;
      };
    };
    extraPlugins = [
      pkgs.vimPlugins.typst-preview-nvim
      pkgs.vimPlugins.presence-nvim
    ];

  };
}
