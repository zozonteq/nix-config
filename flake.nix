{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nix-darwin,
      nixvim,
      nix-on-droid,
      ...
    }:
    {
      nixOnDroidConfigurations = {
        droid-srv1 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
            nixvim.homeManagerModules.default
            ./hosts/droid/srv1/default.nix
            ./hosts/droid/shared.nix
          ];
        };
        droid-srv2 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
            nixvim.homeManagerModules.default
            ./hosts/droid/srv2/default.nix
            ./hosts/droid/shared.nix
          ];
        };
        droid-srv3 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
            nixvim.homeManagerModules.default
            ./hosts/droid/srv3/default.nix
            ./hosts/droid/shared.nix
          ];
        };
      };
      darwinConfigurations = {
        darwin-mac1 = nix-darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./hosts/darwin/shared.nix
            ./hosts/darwin/mac1
          ];
        };
        darwin-mac2 = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/darwin/shared.nix
            ./hosts/darwin/mac2
          ];
        };
      };
      # todo: nixos configuration
      homeConfigurations = {
        darwin-mac1 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/darwin.nix
          ];
        };
        darwin-mac2 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/darwin.nix
          ];
        };
        linux-server1 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/linux.nix
          ];
        };
        droid-srv1 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/droid.nix
          ];
        };
        droid-srv2 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/droid.nix
          ];
        };

        droid-srv3 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/droid.nix
          ];
        };

      };
    };
}
