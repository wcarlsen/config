{pkgs, ...}: {
  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin
    ec2-instance-selector
  ];

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
