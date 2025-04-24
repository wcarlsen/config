{pkgs, ...}: {
  home.packages = with pkgs; [
    google-cloud-sdk
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["gcloud"];
}
