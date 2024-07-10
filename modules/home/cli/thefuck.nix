{nixpkgs-master, system, ...}:
let
  masterPkgs = import nixpkgs-master { inherit system; };
in
{
  home.packages = with masterPkgs; [thefuck];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["thefuck"];
}
