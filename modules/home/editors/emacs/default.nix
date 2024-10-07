{
  pkgs,
  org-babel,
  ...
}: let
  tangle = org-babel.lib.tangleOrgBabel {
    languages = ["emacs-lisp"];
  };
in {
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      package = pkgs.emacs-unstable;
      alwaysEnsure = true;
      alwaysTangle = true;
      config = ./init.org;
      defaultInitFile = false;
      extraEmacsPackages = epkgs: [
        epkgs.treesit-grammars.with-all-grammars
      ];  
    })
  ];
  home.file.".emacs.d/init.el".text = tangle (builtins.readFile ./init.org);
}
