{
  nixpkgs-master,
  system,
  ...
}: let
  masterPkgs = import nixpkgs-master {inherit system;};
in {
  home.packages = with masterPkgs; [
    darktable
  ];
}
