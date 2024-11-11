{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    alejandra
    devenv
    deadnix
    statix
  ];
}
