{pkgs, ...}: {
  home.packages = with pkgs; [
    gyroflow
    kdePackages.kdenlive
  ];
}
