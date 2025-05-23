{
  imports = [
    ./helix.nix
    ./vscode.nix
    ./neovim.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL_EDITOR = "codium";
  };
}
