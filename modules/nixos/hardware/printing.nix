{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Autodiscovery network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
