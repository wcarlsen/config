{
  imports = [
    ./helix.nix
    ./vscode.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL_EDITOR = "codium";
  };
}
