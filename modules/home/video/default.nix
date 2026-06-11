{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: {
  home.packages = with pkgs; [
    # gyroflow
    kdePackages.kdenlive
    # davinci-resolve # start using when v21 lands in unstable
  ];
}
