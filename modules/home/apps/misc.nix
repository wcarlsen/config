{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    dbeaver-bin
    discord
    github-desktop
    insomnia
    mpv
    slack
    spotify
    teams-for-linux
  ];
}
