{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/home
  ];

  home.stateVersion = "22.11";
}
