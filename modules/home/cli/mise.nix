{
  programs.mise.enable = true;
  programs.direnv = {
    mise.enable = true;
  };

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["mise"];
}
