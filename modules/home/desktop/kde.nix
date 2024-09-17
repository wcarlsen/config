{plasma-manager, ...}: {
  imports = [
    (plasma-manager + "/modules")
  ];

  programs.plasma = {
    enable = true;
    # overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      wallpaper = ./backgrounds/hannah-montana-linux.png;
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
