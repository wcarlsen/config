{pkgs, ...}: let
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
    fluxcd-operator
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
    # sofka
  ];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["kubectl"];

  # Alias
  programs.zsh.shellAliases = {
    k = "kubectl";
    kx = "kubie ctx";
    kb = "kubie ns";
    sofkapriv = "sofka --write";
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

  # Sofkas
  programs.sofka = {
    enable = true;
    skin = {name = "catppuccin-mocha";};
    settings = {
      readonly = true;
    };
  };
}
