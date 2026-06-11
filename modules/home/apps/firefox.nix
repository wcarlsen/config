{config, ...}: {
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox"; # adopt the new default behavior
  };
}
