{
  programs.git = {
    enable = true;
    userName = "Willi Carlsen";
    userEmail = "carlsenwilli@gmail.com";
    extraConfig = {
      github = {
        user = "wcarlsen";
        signing = "0x983F48E12A6B265E";
      };
      push.autoSetupRemote = true;
      pull = {
        rebase = false;
      };
    };
    diff-so-fancy.enable = true;
  };

  # Git tui
  programs.lazygit = {
    enable = true;
  };

  # Github tui
  programs = {
    gh.enable = true;
    gh-dash.enable = true;
  };

  # Zsh plugins
  programs.zsh.oh-my-zsh.plugins = ["git"];

  # Aliases
  programs.zsh.shellAliases = {
    groot = "cd $(git rev-parse --show-toplevel)";
    ghprc = "gh pr create --fill";
  };
}
