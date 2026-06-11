{pkgs, ...}: {
  home.packages = with pkgs; [
    darktable
    focus-stack
  ];
}
