{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform-ls
    tflint
    # tfsec
    trivy
    # checkov
    terraform-docs
    tfswitch
  ];

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["terraform"];
}
