{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    apacheKafka
    azure-cli
    bat
    bind
    borgbackup
    envsubst
    fd
    fzf
    github-copilot-cli
    gitleaks
    gnumake
    gnupg
    hey
    htop
    ipcalc
    jq
    ncspot
    pre-commit
    ripgrep # also required for telescope live_grep in Neovim
    sops
    tig
    tldr
    tree
    tuxedo
    wget
    xsel
    yubikey-manager
    yubikey-personalization
  ];
}
