{
  lib,
  nixpkgs-master,
  system,
  ...
}: let
  masterPkgs = import nixpkgs-master {inherit system;};
in {
  home.packages = with masterPkgs; [
    worktrunk
  ];

  programs.zsh.initContent = lib.mkOrder 2000 ''
    eval "$(${masterPkgs.worktrunk}/bin/wt config shell init zsh)"
  '';

  xdg.configFile."worktrunk/config.toml".text = ''
    skip-shell-integration-prompt = true
    worktree-path = "../{{ branch | sanitize }}"
    [post-start]
    copy = "wt step copy-ignored"
  '';
}
