{username, ...}: {
  nix.settings = {
    # Home-manager requirement
    allowed-users = [username];

    # Remote host install requirement
    trusted-users = ["root" username];
  };
}
