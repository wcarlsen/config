{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;

    # Colorscheme
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.flavour = "mocha";

    # Leader
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    # Options
    opts = {
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

    # Keymaps
    keymaps = [
      {
        key = "<leader>ft";
        action = ":Neotree<CR>";
      }
    ];

    # Plugins
    plugins = {
      # Visual
      lualine.enable = true;
      rainbow-delimiters.enable = true;
      bufferline.enable = true;
      web-devicons.enable = true; # required by bufferline and telescope
      indent-blankline.enable = true;
      treesitter = {
        enable = true;
        settings.auto_install = true;
      };
      noice = {
        enable = true;
        # notify.enabled = false;
      };

      # File browsing
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files hidden=true";
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
            # Nix
            alejandra.enable = true;

            # Python
            black.enable = true;
            isort.enable = true;

            # Go
            gofmt.enable = true;

            # Terraform
            terraform_fmt.enable = true;

            # Yaml
            yamlfmt.enable = true;
            # yamllint.enable = true;

            # Shell
            shellharden.enable = true;
          };
        };
      };
      trouble.enable = true;

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
      comment.enable = true;
      nvim-autopairs.enable = true;
      sleuth.enable = true;
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
