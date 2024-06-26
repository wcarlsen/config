{config, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix
    ./emacs
    # ./neovim.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL_EDITOR = "codium";
  };
}
