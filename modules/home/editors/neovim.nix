{
  config,
  pkgs,
  ...
}: {
  programs = {
    nixvim = {
      enable = true;
      colorschemes.catppuccin = {
        enable = true;
        flavour = "mocha";
      };
      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };
      opts = {
        number = true;
        relativenumber = true;
        hlsearch = true;
        ignorecase = true;
        smartcase = true;
        wrap = true;
        linebreak = true;
        swapfile = false;
        guifont = "FantasqueSansM Nerd Font:h13";
      };
      plugins = {
        # Editor
        lualine.enable = true;
        rainbow-delimiters.enable = true;
        bufferline.enable = true;
        indent-blankline.enable = true;
        treesitter.enable = true;
        comment-nvim.enable = true;
        nvim-autopairs.enable = true;

        # Browsing
        web-devicons.enable = true;
        telescope = {
          enable = true;
          keymaps = {
            "<leader>ff" = "find_files hidden=true";
            "<leader>fg" = "git_files";
            "<leader>fs" = "live_grep";
            "<leader>fb" = "buffers";
            "<leader>fh" = "help_tags";
          };
        };
        neo-tree = {
          enable = true;
          settings.window.position = "right";
        };

        # Syntax
        sleuth.enable = true;

        # Git
        gitsigns.enable = true;
        fugitive.enable = true;
      };
    };
  };

  programs.neovide.enable = true;
  programs.nixvim.extraConfigLua = ''
    if vim.g.neovide then
      local function copy() vim.cmd([[normal! "+y]]) end
      local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

      vim.keymap.set("v", "<S-C-c>", copy, { silent = true, desc = "Copy" })
      vim.keymap.set({ "n", "i", "v", "c", "t" }, "<S-C-v>", paste, { silent = true, desc = "Paste" })
    end
  ''; # add copy pasta functionality for neovide
}
