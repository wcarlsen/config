{username, ...}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
