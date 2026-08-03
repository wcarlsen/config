{
  imports = [
    ./extra-options.nix
    ./settings.nix
    ./cachix.nix
    ./config.nix
    ./summary.nix
    ./auto-upgrade.nix
    ./nh.nix # only in unstable
    ./nix-ld.nix
  ];
}
