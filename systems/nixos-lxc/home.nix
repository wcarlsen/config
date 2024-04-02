{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/home/user
    ./../../modules/home/shells
  ];

  home.stateVersion = "23.11";
}
