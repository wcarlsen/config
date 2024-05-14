{
  pkgs,
  k9s-catppuccin,
  ...
}:
{
  home.packages = with pkgs; [
    kubectl
    kubernetes-helm
    kustomize
    minikube
    fluxcd
    argo
    kubent
    kubie
    cmctl
    weave-gitops
    eks-node-viewer
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["kubectl"];

  # Alias
  programs.zsh.shellAliases = {
    k = "kubectl";
    kx = "kubie ctx";
    kb = "kubie ns";
  };

  # Kubie
  home.file.".kube/kubie.yaml".text = ''
    shell: zsh
    configs:
      include:
        - ~/.kube/config*.yaml
    prompt:
      zsh_use_rps1: true
  '';

  # K9s
  programs.k9s = {
    enable = true;
    settings = {
      k9s.ui.skin = "catppuccin-mocha";
    };
  };

  xdg.configFile."k9s/skins/catppuccin-mocha.yaml".source = "${k9s-catppuccin}/dist/catppuccin-mocha.yaml";
}
