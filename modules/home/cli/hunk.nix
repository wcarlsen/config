{
  programs.hunk = {
    enable = true;
    enableGitIntegration = true; # Optional: set hunk as default git pager
    settings = {
      theme = "catppuccin-mocha";
      mode = "split";
      line_numbers = true;
    };
  };
}
