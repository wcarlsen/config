{
  pkgs,
  gpg-conf,
  ...
}: {
  home.file.".gnupg/gpg.conf".source = "${gpg-conf}/gpg.conf";
  home.file.".gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 60
    max-cache-ttl 120
    pinentry-program ${pkgs.pinentry-qt}/bin/pinentry-qt
  '';
}
