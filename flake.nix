{
  inputs = {
    # Nix packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.04";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

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
  };

  outputs = {
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    plasma-manager,
    ssh-keys,
    k9s-catppuccin,
    ...
  }: let
    username = "wcarlsen";
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit pkgs system username plasma-manager k9s-catppuccin;};
      home-manager.sharedModules = [];
    };
  in {
    nixosConfigurations = {
      nixos-x1 = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
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
        inherit system;
        specialArgs = {
          inherit username ssh-keys;
          hostname = "nixos-p15v";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-p51
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
