{
  pkgs,
  ssh-keys,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Willi Carlsen";
    userEmail = "carlsenwilli@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      push.autoSetupRemote = true;
      pull = {
        rebase = false;
      };
    };
    diff-so-fancy.enable = true;
  };

  # Git tui
  programs.lazygit = {
    enable = true;
  };

  # Github tui
  programs = {
    gh.enable = true;
    gh.extensions = with pkgs; [
      gh-copilot
    ];
    gh-dash.enable = true;
  };

  # Zsh plugins
  programs.zsh.oh-my-zsh.plugins = ["git"];

  # Aliases
  programs.zsh.shellAliases = {
    groot = "cd $(git rev-parse --show-toplevel)";
    ghprc = "gh pr create --fill";
  };

  # Allowed signers
  home.file.".ssh/allowed_signers".text = ssh-keys.outPath;
}
