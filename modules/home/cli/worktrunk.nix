{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    worktrunk
  ];

  programs.zsh.initContent = lib.mkOrder 2000 ''
    eval "$(${pkgs.worktrunk}/bin/wt config shell init zsh)"
  '';

  xdg.configFile."worktrunk/config.toml".text = ''
    skip-shell-integration-prompt = true
    worktree-path = "../{{ branch | sanitize }}"
    [post-start]
    copy = "wt step copy-ignored"
  '';
}
