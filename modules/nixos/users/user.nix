{
  pkgs,
  username,
  ssh-keys,
  ...
}: {
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keyFiles = [ssh-keys.outPath];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
