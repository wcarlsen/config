{
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    gnupg
    sops
    ripgrep # also required for telescope live_grep in Neovim
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
    azure-cli
    github-copilot-cli
    apacheKafka
    envsubst
  ];
}
