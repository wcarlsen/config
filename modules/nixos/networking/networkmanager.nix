{username, ...}: {
  # Enable networking
  networking.networkmanager.enable = true;

  # Nameservers
  # networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  # networking.networkmanager.dns = "none";
  # networking.dhcpcd.extraConfig = "nohook resolv.conf";

  users.users."${username}" = {
    extraGroups = ["networkmanager"];
  };
}
