{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  stablePkgs = import nixpkgs-stable {inherit system;};
in {
  home.packages = with pkgs; [
    gnumake
    gnupg
    sops
    silver-searcher
    bind
    pre-commit
    yubikey-manager
    yubikey-personalization
    gitleaks
    fzf
    fd
    xsel
    htop
    tree
    bat
    tldr
    tig
    borgbackup
    hey
    jq
    ipcalc
    wget
    ncspot
    # azure-cli (from nixos-stable because it's broken on unstable)
    stablePkgs.azure-cli
    github-copilot-cli
    apacheKafka
    envsubst
  ];
}
