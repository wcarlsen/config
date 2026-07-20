{
  imports = [
    ./mcp.nix
    ./helix.nix
    ./vscode.nix
    ./neovim.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL_EDITOR = "code";
  };
}
