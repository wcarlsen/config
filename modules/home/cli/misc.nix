{pkgs, ...}: {
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
  ];
}
