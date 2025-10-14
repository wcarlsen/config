{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  stablePkgs = import nixpkgs-stable {inherit system;};
in {
  home.packages = with pkgs;
    [
      # awscli2
      ssm-session-manager-plugin
      ec2-instance-selector
    ]
    ++ (with stablePkgs; [
      awscli2
    ]);

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
