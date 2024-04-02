{pkgs, ...}: {
  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin
  ];

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
