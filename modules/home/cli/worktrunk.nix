{
  worktrunk,
  system,
  ...
}: {
  home.packages = [worktrunk.packages.${system}.default];
}
