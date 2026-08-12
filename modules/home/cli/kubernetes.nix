{
  pkgs,
  k9s-catppuccin,
  k9s,
  ...
}: let
  minikubeWithPatch = pkgs.minikube.overrideAttrs (
    finalAttrs: previousAttrs: {
      postInstall =
        (previousAttrs.postInstall or "")
        + ''
          rm -f "$out/bin/kubectl"
        '';
    }
  ); # minikube conflicts with kubectl
in {
  home.packages = with pkgs; [
    (wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-diff
        helm-schema
      ];
    })
    kustomize
    minikubeWithPatch
    kubectl
    fluxcd
    kubent
    kubie
    cmctl
    weave-gitops
    eks-node-viewer
    kubeconform
    velero
    kor
    kyverno
    clusterctl
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["kubectl"];

  # Alias
  programs.zsh.shellAliases = {
    k = "kubectl";
    kx = "kubie ctx";
    kb = "kubie ns";
    k9s = "k9s --readonly";
    k9spriv = "k9s --readonly=false";
  };

  # Kubie
  home.file.".kube/kubie.yaml".text = ''
    shell: zsh
    configs:
      include:
        - ~/.kube/config*.yaml
        - ~/.kube/config
    prompt:
      zsh_use_rps1: true
  '';

  # Minikube
  home.file.".minikube/config/config.json".text = ''
    {
      "rootless": true,
      "driver": "podman",
      "container-runtime": "containerd"
    }
  '';

  # K9s
  programs.k9s = {
    enable = true;
    settings = {
      refreshRate = 10;
      k9s.ui.skin = "catppuccin-mocha";
    };
  };
  xdg.configFile."k9s/skins/catppuccin-mocha.yaml".source = "${k9s-catppuccin}/dist/catppuccin-mocha.yaml";
  xdg.configFile."k9s/plugins/flux.yaml".source = "${k9s}/plugins/flux.yaml";
  xdg.configFile."k9s/plugins/external-secrets.yaml".source = "${k9s}/plugins/external-secrets.yaml";
}
