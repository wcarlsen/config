{pkgs, ...}: {
  home.packages = with pkgs; [
    poetry
    python311Packages.python-lsp-server
    gcc
  ];

  programs.zsh.sessionVariables = {
    POETRY_VIRTUALENVS_IN_PROJECT = 1;
  };
}
