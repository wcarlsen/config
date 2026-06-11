{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    dbeaver-bin
    discord
    github-desktop
    handy
    insomnia
    mpv
    slack
    spotify
    teams-for-linux
  ];
}
