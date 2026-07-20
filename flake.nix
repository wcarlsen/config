{
  inputs = {
    # Nix packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
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

    # NixVim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Catppuccin for k9s
    k9s-catppuccin.url = "github:catppuccin/k9s";
    k9s-catppuccin.flake = false;

    # K9s
    k9s.url = "github:derailed/k9s";
    k9s.flake = false;

    # Hunk
    hunk.url = "github:modem-dev/hunk";
    hunk.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = {
    nixpkgs-master,
    nixpkgs-unstable,
    nixpkgs-stable,
    nixos-hardware,
    home-manager,
    plasma-manager,
    ssh-keys,
    nixvim,
    k9s-catppuccin,
    k9s,
    hunk,
    ...
  }: let
    username = "wcarlsen";
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "electron-39.8.10"
      ];
    };
    homeManagerConf = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = import ./home.nix;
      home-manager.extraSpecialArgs = {
        inherit
          pkgs
          nixpkgs-stable
          nixpkgs-master
          system
          username
          ssh-keys
          k9s-catppuccin
          k9s
          ;
      };
      home-manager.sharedModules = [
        nixvim.homeModules.nixvim
        plasma-manager.homeModules.plasma-manager
        hunk.homeManagerModules.default
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
