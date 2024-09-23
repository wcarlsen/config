{
  pkgs,
  config,
  username,
  ssh-keys,
  ...
}: {

  sops.secrets.wcarlsen-password.neededForUsers = true;
  users.mutableUsers = false;

  users.users."${username}" = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.wcarlsen-password.path;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keyFiles = [ssh-keys.outPath];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
