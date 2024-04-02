{
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "*-*-* 07:00:00";
    randomizedDelaySec = "1h";
    flake = "github:wcarlsen/config";
  };
}
