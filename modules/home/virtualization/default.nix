{pkgs, ...}: {
  services.podman.enable = true;

  programs.zsh.shellAliases = {
    docker = "podman";
  };

  home.packages = with pkgs; [
    podman-compose
  ];
}
