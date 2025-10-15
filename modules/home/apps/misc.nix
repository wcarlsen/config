{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden
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
