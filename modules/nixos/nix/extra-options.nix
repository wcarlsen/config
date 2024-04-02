{
  nix.extraOptions = ''
    experimental-features = nix-command flakes repl-flake
    warn-dirty = false
    auto-optimise-store = true
    max-jobs = auto
  '';
}
