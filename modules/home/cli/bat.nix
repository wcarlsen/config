{pkgs, ...}: {
  home.packages = with pkgs; [bat];

  # Alias
  programs.zsh.shellAliases = {
    cat = "bat -p";
  };
}
