{
  inputs = {
    # Nix packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Hardware modules
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Manage home
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Plasma-manager
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Nixvim
    # nixvim.url = "github:nix-community/nixvim";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Emacs-overlay
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs-unstable";
    org-babel.url = "github:emacs-twist/org-babel";

    # Ssh keys
    ssh-keys.url = "https://github.com/wcarlsen.keys";
    ssh-keys.flake = false;

    # Gpg config
    gpg-conf.url = "github:drduh/config";
    gpg-conf.flake = false;

    # Catppuccin for k9s
    k9s-catppuccin.url = "github:catppuccin/k9s";
    k9s-catppuccin.flake = false;
  };

  outputs = inputs @ {
    # nixpkgs,
    nixpkgs-unstable,
    # nixpkgs-master,
    nixos-hardware,
    home-manager,
    plasma-manager,
    # nixvim,
    emacs-overlay,
    org-babel,
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
      overlays = [(import emacs-overlay)];
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs system username plasma-manager org-babel gpg-conf k9s-catppuccin;};
      home-manager.sharedModules = [
        # nixvim.homeManagerModules.nixvim
      ];
    };
  in {
    nixosConfigurations = {
      nixos-x1 = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-x1";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          home-manager.nixosModules.home-manager
          homeManagerConf
        ];
      };
      nixos-p15v = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-p15v";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-p50
          home-manager.nixosModules.home-manager
          homeManagerConf
        ];
      };
      nixos-surface = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-surface";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.microsoft-surface-pro-intel
          home-manager.nixosModules.home-manager
          homeManagerConf
        ];
      };
    };
  };
}
