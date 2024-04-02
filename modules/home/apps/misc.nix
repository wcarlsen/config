{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    slack
    yubikey-manager-qt
    bitwarden
    mpv
    github-desktop
  ];
}
# {
#   pkgs,
#   nixpkgs-unstable,
#   system,
#   ...
# }: let
#   unstable = import nixpkgs-unstable {
#     inherit system;
#     config.allowUnfree = true;
#   };
# in {
#   home.packages =
#     (with pkgs; [
#       spotify
#       firefox
#       slack
#       yubikey-manager-qt
#       bitwarden
#       mpv
#       github-desktop
#     ])
#     ++ (with unstable; [
#       warp-terminal
#     ]);
# }

