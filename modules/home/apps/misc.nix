{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    slack
    yubikey-manager-qt
    mpv
    github-desktop
    insomnia
    bitwarden
    dbeaver-bin
  ];
}
