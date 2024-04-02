{ pkgs, modulesPath, hostname, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
    ./../../modules/nixos/nix
    ./../../modules/nixos/networking
    ./../../modules/nixos/system/time.nix
    ./../../modules/nixos/users
    ./../../modules/nixos/virtualization/docker.nix
  ];

  system.stateVersion = "23.11"; # Did you read the comment?s
}