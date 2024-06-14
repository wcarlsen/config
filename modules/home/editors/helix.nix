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
      # keys.normal."C-f" = [":new" ":insert-output TEMP=$(mktemp); lf -selection-path=$TEMP; cat $TEMP" "select_all" "split_selection_on_newline" "goto_file" "goto_last_modified_file" ":buffer-close!" ":redraw"];
    };
  };

  # programs.lf.enable = true;
}
