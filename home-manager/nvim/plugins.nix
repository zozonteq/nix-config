{ ... }:
{
  programs.nixvim.plugins = {
    lz-n = {
      enable = true;
    };
    wakatime = {
      enable = true;
    };
    presence-nvim = {
      enable = true;
      workspaceText = "Working on private project";
      editingText = "Editing %s";
    };
    vim-dadbod-ui = {
      enable = true;
    };
    lualine = {

      enable = true;
    };
    bufferline = {
      enable = true;
    };
    barbecue = {
      enable = true;
      settings = {
      };
    };
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
    web-devicons = {
      enable = true;
    };
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
    illuminate = {
      enable = true;
    };
    colorizer = {
      enable = true;
    };
    todo-comments = {
      enable = true;
    };
    alpha = {
      enable = true;
      theme = "dashboard";
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
    flutter-tools = {
      enable = true;
    };
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
    cmp-spell = {
      enable = true;
    };
    noice = {
      enable = true;
    };
    typst-vim = {
      enable = true;
    };
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
        clojure_lsp.enable = true;
        phpactor.enable = true;
        eslint = {
          enable = true;
        };
        dartls.enable = true;
        terraformls.enable = true;
      };
    };
    lint = {
      enable = false;
      lintersByFt = { };
    };
    comment = {
      enable = true;
    };
  };
}
