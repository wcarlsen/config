{pkgs, ...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableGitIntegration = true; # configure Git to globally ignore .direnv/
  };

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["direnv"];
}
