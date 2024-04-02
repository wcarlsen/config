{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.bash-language-server
    shellcheck
  ];

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      timonwong.shellcheck
    ];
  };
}
