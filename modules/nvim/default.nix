{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ripgrep
    vscode-langservers-extracted
    tinymist
  ];
  programs.nixvim = {
    opts = {
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      number = true;
      relativenumber = true;
      autoindent = true;
      scrolloff = 5;
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
      treesitter = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      # cmp
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
            "<CR>" = [
              "accept"
              "fallback"
            ];
          };
          completion = {
            list = {
              selection = "auto_insert";
            };
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
          };
          format_on_save = {
            timeout_ms = 1000;
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
        };

      };
    };
    extraPlugins = [
      pkgs.vimPlugins.typst-preview-nvim
    ];

  };
}
