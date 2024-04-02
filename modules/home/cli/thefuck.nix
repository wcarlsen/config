{pkgs, ...}: {
  home.packages = with pkgs; [thefuck];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["thefuck"];
}
