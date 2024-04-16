{plasma-manager, ...}: {
  imports = [
    (plasma-manager + "/modules")
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "select";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      wallpaper = ./backgrounds/harske-hubbi.jpg;
    };
  };
}