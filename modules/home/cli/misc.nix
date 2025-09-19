{pkgs, nixpkgs, system, ...}:
let
  stablePkgs = import nixpkgs { inherit system; };
in{
  home.packages = with pkgs; [
    gnumake
    gnupg
    sops
    silver-searcher
    bind
    pre-commit
    bind
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
  ] ++ (with stablePkgs; [
    azure-cli
  ]);
}
