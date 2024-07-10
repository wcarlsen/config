{pkgs, nixpkgs-master, system, ...}:
let
  masterPkgs = import nixpkgs-master { inherit system; };
in{
  home.packages = with pkgs; [
    spotify
    slack
    yubikey-manager-qt
    mpv
    github-desktop
    insomnia
  ] ++ (with masterPkgs; [
    bitwarden
  ]);
}
