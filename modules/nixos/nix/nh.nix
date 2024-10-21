{username, ...}: {
  programs.nh = {
    enable = true;
    flake = "/home/${username}/spaghetti/config";
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };
}
