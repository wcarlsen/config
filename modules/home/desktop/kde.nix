{
  pkgs,
  plasma-manager,
  ...
}: {
  imports = [
    (plasma-manager + "/modules")
  ];

  home.packages = with pkgs; [
    banana-cursor
  ];

  programs.plasma = {
    enable = true;
    # overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      theme = "breeze-dark";
      cursor.theme = "Banana";
      cursor.size = 40;
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
