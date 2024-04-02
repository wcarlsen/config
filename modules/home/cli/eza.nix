{pkgs, ...}: {
  home.packages = with pkgs; [eza];

  # Alias
  programs.zsh.shellAliases = {
    l = "eza --long --header --group-directories-first --git -a --icons";
  };
}
