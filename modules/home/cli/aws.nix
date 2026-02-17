{pkgs, ...}: {
  home.packages = with pkgs; [
    awscli2
    ec2-instance-selector
    ssm-session-manager-plugin
  ];

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
