{pkgs, ...}: {
  home.packages = with pkgs; [
    (callPackage ./flate.nix {})
  ];
}
