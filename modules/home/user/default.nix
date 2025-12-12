{username, ...}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # matchBlocks = {
    #   "github.com" = {
    #     hostname = "ssh.github.com";
    #     user = "git";
    #     port = 443;
    #   };
    # };
  };
}
