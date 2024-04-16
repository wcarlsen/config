{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    options = {
      number = true;
      relativenumber = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      wrap = true;
      linebreak = true;
      swapfile = false;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>ft";
        options.silent = true;
        action = "<cmd>Neotree toggle<CR>";
      }
    ];
    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
      friendly-snippets
      vim-visual-multi
    ];
    plugins = {
      lualine.enable = true;
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fp" = "git_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };
      neo-tree = {
        enable = true;
        window.position = "right";
      };
      treesitter.enable = true;
      rainbow-delimiters.enable = true;
      none-ls = {
        enable = true;
        sources = {
          code_actions = {
            shellcheck.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            black.enable = true;
            isort.enable = true;
            gofmt.enable = true;
          };
        };
      };
      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            "gd" = "definition";
            "gD" = "references";
            "gt" = "type_definition";
            "gi" = "implementation";
            "gf" = "format";
            "K" = "hover";
          };
        };
        servers = {
          nil_ls.enable = true;
          terraformls.enable = true;
          yamlls.enable = true;
          bashls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          # dagger.enable = true; # cue
        };
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        snippet.expand = "luasnip";
      };
      luasnip = {
        enable = true;
        fromVscode = [{}];
      };
      noice = {
        enable = true;
      };
      comment-nvim.enable = true;
      indent-blankline.enable = true;
      gitsigns.enable = true;
      fugitive.enable = true;
      bufferline.enable = true;
      nix.enable = true;
      floaterm.enable = true;
      nvim-autopairs.enable = true;
    };
  };

  home.packages = with pkgs;
    (
      if config.programs.nixvim.plugins.telescope.enable
      then [ripgrep]
      else []
    )
    ++ [];
}
