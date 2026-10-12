{
  lib,
  buildGoModule,
  fetchFromGitHub,
  versionCheckHook,
  nix-update-script,
  # installShellFiles,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "go-aw-sso";
  version = "1.5.3";

  src = fetchFromGitHub {
    owner = "theurichde";
    repo = "go-aws-sso";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-PtINyZMo1aMrZ3aXM/lt5TmqWHIFzlbNCiKH6yzsawQ=";
  };

  vendorHash = "sha256-l2wF35HoDyI/9Yc3U2L/qNZYDyrPJC0C2t4j+sx+uac=";

  subPackages = ["cmd/go-aws-sso"];

  meta = {
    description = "Make working with AWS SSO on local machines an ease";
    license = lib.licenses.mit;
    homepage = "https://github.com/theurichde/go-aws-sso";
    changelog = "https://github.com/theurichde/go-aws-sso/releases/tag/v${finalAttrs.version}";
    mainProgram = "go-aws-sso";
    maintainers = with lib.maintainers; [wcarlsen];
  };
})
