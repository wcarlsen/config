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
      awscli2
      ec2-instance-selector
    ]
    ++ (with stablePkgs; [
      ssm-session-manager-plugin
    ]);

  # Easy assume roles
  programs.granted.enable = true;

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["aws"];
}
