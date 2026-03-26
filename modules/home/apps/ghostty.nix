{pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "Maple Mono";
      font-size = 13;
      font-feature = "liga, dlig, calt";
    };
  };

  i18n.inputMethod = {
    # enable = true;
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
      qt6Packages.fcitx5-with-addons
      fcitx5-m17n
    ];
  };
}
