{username, ...}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

   programs.ssh = {
     enable = true;

    matchBlocks = {
      "yubikey-hosts" = {
        host = "github.com";
        identitiesOnly = true;
        identityFile = ["~/.ssh/id_rsa_yubikey.pub"];
      };
    };
   };
}
