{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y"; # Legacy default (`yy`) because `home.stateVersion` is less than "26.05". Silence warning with `y`.
  };
}
