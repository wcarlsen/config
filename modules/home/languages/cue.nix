{pkgs, ...}: {
  home.packages = with pkgs; [
    cue
  ];

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      asdine.cue
    ];
  };
}
