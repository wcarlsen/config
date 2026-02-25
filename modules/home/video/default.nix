{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  stablePkgs = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    # gyroflow (from nixos-stable because it's broken on unstable)
    stablePkgs.gyroflow
    kdePackages.kdenlive
  ];
}
