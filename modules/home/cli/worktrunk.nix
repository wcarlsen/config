{
  lib,
  worktrunk,
  system,
  ...
}: {
  home.packages = [worktrunk.packages.${system}.default];

  programs.zsh.initContent = lib.mkOrder 2000 ''
    eval "$(wt config shell init zsh)"
  '';

  xdg.configFile."worktrunk/config.toml".text = ''
    skip-shell-integration-prompt = true
    worktree-path = "../{{ branch | sanitize }}"
  '';
}
