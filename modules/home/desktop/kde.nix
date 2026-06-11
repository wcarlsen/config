{pkgs, ...}: {
  home.packages = with pkgs; [
    banana-cursor
  ];

  services.kdeconnect.enable = true;

  programs.plasma = {
    enable = true;
    # overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      theme = "breeze-dark";
      cursor.theme = "Banana";
      cursor.size = 40;
      colorScheme = "BreezeDark";
    };
    fonts = {
      general = {
        family = "FantasqueSansM Nerd Font";
        pointSize = 12;
      };
    };
    kwin = {
      nightLight = {
        enable = true;
        mode = "times";
        time = {
          morning = "06:30";
          evening = "19:30";
        };
        transitionTime = 30;
      };
    };
  };
}
