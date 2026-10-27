{
  lib,
  buildGoModule,
  fetchFromGitHub,
  versionCheckHook,
  nix-update-script,
  installShellFiles,
  pkgs,
  ...
}:
(pkgs.buildGoModule.override {go = pkgs.go_1_27;}) (finalAttrs: {
  pname = "flate";
  version = "0.6.5";

  src = fetchFromGitHub {
    owner = "home-operations";
    repo = "flate";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-Z1bhf54xJSrCiLgRfzGuZ7ORzLgdFe5PfEVZzs8hkew=";
  };

  vendorHash = "sha256-6ZmGkdHW2/8wk/dKN9MkB+JF0/GFIw2TxZHeWShLsQ0=";

  subPackages = ["cmd/flate"];

  nativeBuildInputs = [installShellFiles];

  ldflags = [
    "-s -w"
    "-X 'main.version=${finalAttrs.version}'"
  ];

  doInstallCheck = true;
  nativeInstallCheckInputs = [
    versionCheckHook
  ];
  versionCheckProgramArg = "--version";

  meta = {
    description = "Render and diff Flux GitOps repositories fully offline.";
    license = lib.licenses.asl20;
    homepage = "https://github.com/home-operations/flate";
    changelog = "https://github.com/home-operations/flate/releases/tag/v${finalAttrs.version}";
    mainProgram = "flate";
    maintainers = with lib.maintainers; [wcarlsen];
  };
})
