{
  helix,
  system,
  ...
}: {
  programs.helix = {
    enable = true;
    package = helix.packages.${system}.default;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursorline = true;
        bufferline = "multiple";
        color-modes = true;
        soft-wrap.enable = true;
        completion-trigger-len = 2;
        whitespace.render.tab = "all";
        trim-trailing-whitespace = true;
        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        auto-format = true;
        line-number = "relative";
        indent-guides = {
          render = true;
          skip-levels = 1;
        };
      };
      keys.normal.esc = [
        "collapse_selection"
        "keep_primary_selection"
      ];
      keys.insert."C-space" = [
        "completion"
      ];
    };
  };
}
