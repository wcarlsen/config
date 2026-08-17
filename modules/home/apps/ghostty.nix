{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "FantasqueSansM Nerd Font";
      font-size = 13;
      font-feature = "liga, dlig, calt";
    };
  };
}
