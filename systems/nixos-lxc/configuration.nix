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

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      pi-hole = {
        image = "pihole/pihole:latest";
        ports = [
          "53:53/tcp"
          "53:53/udp"
          # "67:67/udp" # Only required if you are using Pi-hole as your DHCP server
          "80:80/tcp"
        ];
        environment = {
          TZ = "Europe/Copenhagen";
        };
        volumes = [
          "./etc-pihole:/etc/pihole"
          "./etc-dnsmasq.d:/etc/dnsmasq.d"
        ];
        autoStart = true;
      };
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?s
}