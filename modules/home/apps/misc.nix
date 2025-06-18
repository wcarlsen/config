{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    slack
    mpv
    github-desktop
    insomnia
    bitwarden
    dbeaver-bin
    code-cursor
  ];
}
