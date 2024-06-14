{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    goreleaser
    gopls
  ];
}
