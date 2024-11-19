{
  inputs = {
    # Nix packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.04";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Hardware modules
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Manage home
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Plasma-manager
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Nixvim
    # nixvim.url = "github:nix-community/nixvim";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Emacs-overlay
    # emacs-overlay.url = "github:nix-community/emacs-overlay";
    # emacs-overlay.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # org-babel.url = "github:emacs-twist/org-babel";

    # Ssh keys
    ssh-keys.url = "https://github.com/wcarlsen.keys";
    ssh-keys.flake = false;

    # Sops
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Secrets
    nix-secrets.url = "git+ssh://git@github.com/wcarlsen/config-secrets.git?ref=master&shallow=1";
    nix-secrets.flake = false;

    # Gpg config
    gpg-conf.url = "github:drduh/config";
    gpg-conf.flake = false;

    # Catppuccin for k9s
    k9s-catppuccin.url = "github:catppuccin/k9s";
    k9s-catppuccin.flake = false;
  };

  outputs = {
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    plasma-manager,
    # nixvim,
    # emacs-overlay,
    # org-babel,
    sops-nix,
    nix-secrets,
    ssh-keys,
    gpg-conf,
    k9s-catppuccin,
    ...
  }: let
    username = "wcarlsen";
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      # overlays = [(import emacs-overlay)];
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs system username plasma-manager gpg-conf k9s-catppuccin;};
      # home-manager.sharedModules = [
      #   nixvim.homeManagerModules.nixvim
      # ];
    };
  in {
    nixosConfigurations = {
      nixos-x1 = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username ssh-keys nix-secrets;
          hostname = "nixos-x1";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          home-manager.nixosModules.home-manager
          homeManagerConf
          sops-nix.nixosModules.sops
        ];
      };
      nixos-p15v = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username ssh-keys nix-secrets;
          hostname = "nixos-p15v";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-p50
          home-manager.nixosModules.home-manager
          homeManagerConf
          sops-nix.nixosModules.sops
        ];
      };
      nixos-surface = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username ssh-keys nix-secrets;
          hostname = "nixos-surface";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.microsoft-surface-pro-intel
          home-manager.nixosModules.home-manager
          homeManagerConf
          sops-nix.nixosModules.sops
        ];
      };
    };
  };
}
