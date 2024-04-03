{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/home/user
    ./../../modules/home/shells
    ./../../modules/home/cli/tmux.nix
  ];

  home.stateVersion = "23.11";
}
