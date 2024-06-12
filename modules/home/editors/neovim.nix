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
      guifont = "FantasqueSansM Nerd Font:h12";
    };
    plugins = {
      # Visual
      lualine.enable = true;
      rainbow-delimiters.enable = true;
      bufferline.enable = true;
      indent-blankline.enable = true;
      treesitter.enable = true;
      noice = {
        enable = true;
        notify.enabled = false;
      };

      # File browsing
      telescope = {
        enable = true;
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
      oil.enable = true;

      # Git
      gitsigns.enable = true;
      fugitive.enable = true;

      # Lint
      none-ls = {
        enable = true;
        sources = {
          # code_actions = {
          #   shellcheck.enable = true;
          # };
          formatting = {
            alejandra.enable = true;
            black.enable = true;
            isort.enable = true;
            gofmt.enable = true;
            terraform_fmt.enable = true;
            yamlfmt.enable = true;
            shellharden.enable = true;
          };
        };
      };

      # Completion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "buffer";}
            {name = "luasnip";}
            {name = "path";}
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
      };

      # Snippets
      luasnip = {
        enable = true;
        fromVscode = [{}];
      };

      # Lsp
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
            "<leader>rn" = "rename";
          };
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
        };
        servers = {
          nil_ls.enable = true;
          terraformls.enable = true;
          yamlls.enable = true;
          bashls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
        };
      };

      # Languages
      nix.enable = true;

      # Misc
      floaterm.enable = true;
      comment-nvim.enable = true;
      nvim-autopairs.enable = true;
    };
  };

  home.packages = with pkgs;
    (
      if config.programs.nixvim.plugins.telescope.enable
      then [ripgrep]
      else []
    )
    ++ [
      neovide
    ];
}
