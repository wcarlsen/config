{
  inputs = {
    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Hardware modules
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Manage home
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Manage KDE plasma
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Ssh keys
    ssh-keys.url = "https://github.com/wcarlsen.keys";
    ssh-keys.flake = false;

    # Catppuccin for k9s
    k9s-catppuccin.url = "github:catppuccin/k9s";
    k9s-catppuccin.flake = false;

    # Helix
    helix.url = "github:helix-editor/helix";
  };

  outputs = {
    nixpkgs-unstable,
    nixpkgs,
    nixos-hardware,
    home-manager,
    plasma-manager,
    ssh-keys,
    k9s-catppuccin,
    helix,
    ...
  }: let
    username = "wcarlsen";
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "libsoup-2.74.3"
      ];
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs nixpkgs system username ssh-keys plasma-manager k9s-catppuccin helix;};
      home-manager.sharedModules = [
      ];
    };
  in {
    nixosConfigurations = {
      nixos-zbook = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-zbook";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          home-manager.nixosModules.home-manager
          homeManagerConf
        ];
      };
      nixos-p15s = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-p15s";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-p14s-intel-gen5
          home-manager.nixosModules.home-manager
          homeManagerConf
        ];
      };
      nixos-surface = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
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
