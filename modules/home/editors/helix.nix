{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursorline = true;
        bufferline = "always";
        soft-wrap.enable = true;
        completion-trigger-len = 0;
        whitespace.render.tab = "all";
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
    };
  };
}
