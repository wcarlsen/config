{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.yaml-language-server
    yq-go
  ];
}
