{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.kdenlive
    gyroflow
  ];
}
