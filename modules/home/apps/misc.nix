{pkgs, ...}: {
  home.packages = with pkgs; [
    dbeaver-bin
    insomnia
    mpv
    slack
    spotify
  ];
}
