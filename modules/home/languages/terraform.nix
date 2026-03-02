{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform-ls
    tflint
    # trivy # diabled for security reasons
    terraform-docs
    tfswitch
    terraform
    opentofu
    terragrunt
    hcledit
  ];

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["opentofu"];
}
