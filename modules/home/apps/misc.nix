{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden-desktop
    dbeaver-bin
    gparted
    # discord
    # github-desktop
    # handy
    insomnia
    mpv
    slack
    spotify
    # teams-for-linux
  ];
}
