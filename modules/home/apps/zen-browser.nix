{
  system,
  zen-browser,
  ...
}: {
  home.packages = [
    zen-browser.packages."${system}".default
  ];
}
