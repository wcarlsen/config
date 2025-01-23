{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      catppuccin.catppuccin-vsc
      github.vscode-github-actions
      golang.go
      bbenoist.nix
      jnoortheen.nix-ide
      hashicorp.terraform
      ms-python.python
      asdine.cue
      timonwong.shellcheck
      mkhl.direnv
      github.copilot
    ];
    userSettings = {
      security.workspace.trust.enabled = false;
      workbench = {
        sideBar.location = "right";
        colorTheme = "Catppuccin Mocha";
      };
      editor = {
        renderWhitespace = "boundary";
        wordWrap = "on";
        fontFamily = "'Maple Mono'";
        fontSize = 18;
        fontLigatures = true;
      };
      terminal.integrated = {
        fontFamily = "'Maple Mono'";
        fontSize = 18;
      };
      files.trimTrailingWhitespace = true;
      "[terraform]"."editor.tabSize" = 2;
      "[javascript]"."editor.tabSize" = 2;
      "[html]"."editor.tabSize" = 2;
      "[json]"."editor.tabSize" = 2;
      "[yaml]"."editor.tabSize" = 2;
      "[nix]"."editor.tabSize" = 2;
      "[lua]"."editor.tabSize" = 2;
      projectManager.git.baseFolders = [
        "~/spaghetti"
      ];
    };
  };
}
