# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{hostname, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./systems/${hostname}/hardware-configuration.nix
    ./modules/nixos
  ];

  system.stateVersion = "23.11"; # Did you read the comment?s
}
