{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    slack
    yubikey-manager-qt
    bitwarden
    mpv
    github-desktop
    playonlinux
  ];
}
