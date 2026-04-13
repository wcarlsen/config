{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform-ls
    tflint
    terraform-docs
    # tfswitch
    terraform
    opentofu
    terragrunt
    hcledit
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["opentofu"];
}
