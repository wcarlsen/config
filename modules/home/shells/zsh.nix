{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      sessionVariables = {
        TERM = "xterm-256color";
        PATH = "$PATH:$HOME/bin";
      };
      oh-my-zsh = {
        enable = true;
      };
    };
    starship.enable = true;
  };
}
