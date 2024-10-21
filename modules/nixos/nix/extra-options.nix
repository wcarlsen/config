{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    auto-optimise-store = true
    max-jobs = auto
  '';
}
