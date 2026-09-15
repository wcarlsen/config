{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform-ls
    tflint
    terraform-docs
    terraform
    opentofu
    terragrunt
    hcledit
    tfctl
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["opentofu"];
}
