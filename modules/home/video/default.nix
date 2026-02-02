{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  stablePkgs = import nixpkgs-stable {inherit system;};
in {
  home.packages = with pkgs;
    [
      gyroflow
    ]
    ++ (with stablePkgs; [
      kdePackages.kdenlive
    ]);
}
