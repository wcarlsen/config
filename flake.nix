{
  inputs = {
    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Hardware modules
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Manage home
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Plasma-manager
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # Emacs-overlay
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    org-babel.url = "github:emacs-twist/org-babel";

    # Ssh keys
    ssh-keys.url = "https://github.com/wcarlsen.keys";
    ssh-keys.flake = false;

    # Gpg config
    gpg-conf.url = "github:drduh/config";
    gpg-conf.flake = false;
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    plasma-manager,
    nixvim,
    emacs-overlay,
    org-babel,
    ssh-keys,
    gpg-conf,
    ...
  }: let
    username = "wcarlsen";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [(import emacs-overlay)];
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs username plasma-manager nixvim org-babel gpg-conf;};
      home-manager.sharedModules = [
        nixvim.homeManagerModules.nixvim
      ];
    };
    homeManagerConfLxc = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./systems/nixos-lxc/home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs username;};
    };
  in {
    nixosConfigurations = {
      nixos-x1 = nixpkgs.lib.nixosSystem {
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
      nixos-surface = nixpkgs.lib.nixosSystem {
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
      nixos-lxc = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-lxc";
        };
        modules = [
          ./systems/nixos-lxc/configuration.nix
          home-manager.nixosModules.home-manager
          homeManagerConfLxc
        ];
      };
    };
  };
}
