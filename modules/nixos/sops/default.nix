{nix-secrets, ...}: let
  secrets = builtins.toString nix-secrets;
in {
  sops.defaultSopsFile = "${secrets}/secrets.yaml";
  sops.age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
}
