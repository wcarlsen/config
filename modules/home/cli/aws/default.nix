{pkgs, ...}: {
  home.packages = with pkgs; [
    awscli2
    aws-iam-authenticator
    ec2-instance-selector
    ssm-session-manager-plugin
    steampipe
    # steampipePackages.steampipe-plugin-aws
    eksctl
    (callPackage ./clusterawsadm.nix {})
    (callPackage ./go-aws-sso.nix {})
    python314Packages.cfn-lint
  ];

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
