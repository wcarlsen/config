{username, ...}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # programs.ssh = {
  #   enable = true;
  #   extraConfig = ''
  #     Host pve
  #       Hostname pve
  #       User root
  #
  #     Host rpi4
  #       Hostname rpi4
  #       User ${username}
  #   '';
  # };
}
