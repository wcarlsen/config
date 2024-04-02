{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    # nixpkgs-fmt
    alejandra
  ];

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jnoortheen.nix-ide
    ];
  };
}
