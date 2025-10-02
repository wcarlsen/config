{
  pkgs,
  nixpkgs-master,
  system,
  ...
}: let
  masterPkgs = import nixpkgs-master {inherit system;};
in {
  home.packages = with pkgs;
    [
      terraform-ls
      tflint
      trivy
      # terraform-docs
      tfswitch
      terraform
      opentofu
      terragrunt
      hcledit
    ]
    ++ (with masterPkgs; [
      terraform-docs
    ]);

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["opentofu"];
}
