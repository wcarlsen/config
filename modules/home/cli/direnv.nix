{pkgs, ...}: {
  home.packages = with pkgs; [direnv];

  # programs.direnv = {
  #   enable = true;
  #   nix-direnv.enable = true;
  # }

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["direnv"];
}
