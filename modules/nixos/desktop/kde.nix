{ pkgs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasmax11";

  # Exclude unused kde packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
  ];
}
