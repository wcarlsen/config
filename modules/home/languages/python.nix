{pkgs, ...}: {
  home.packages = with pkgs; [
    poetry
    ruff
  ];

  programs.zsh.sessionVariables = {
    POETRY_VIRTUALENVS_IN_PROJECT = 1;
  };
}
