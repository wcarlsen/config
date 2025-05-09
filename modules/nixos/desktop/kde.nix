{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true; # set to false for x11
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma"; # use plasmax11 for x11

  # Exclude unused kde packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
  ];
}
