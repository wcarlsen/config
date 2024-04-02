{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/interface".show-battery-percentage = true;
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      "org/gnome/shell".favorite-apps = ["firefox.desktop" "kitty.desktop" "spotify.desktop" "codium.desktop" "slack.desktop"];
      # "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
