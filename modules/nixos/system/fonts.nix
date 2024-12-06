{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # (nerdfonts.override {fonts = ["FantasqueSansMono"];})
    nerd-fonts.fantasque-sans-mono
  ];
}
