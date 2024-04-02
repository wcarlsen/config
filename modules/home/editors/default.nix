{
  imports = [
    ./helix.nix
    ./vscode.nix
    ./emacs
    ./neovim.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL_EDITOR = "codium";
  };
}
