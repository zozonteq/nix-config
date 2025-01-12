{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:spikespaz-contrib/nix-darwin/patch-1";
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
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    ags.url = "github:Aylur/ags";
    ghostty.url = "github:ghostty-org/ghostty";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      nix-on-droid,
      nix-darwin,
      ...
    }@inputs:
    {
      nixOnDroidConfigurations = {
        droid-srv1 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
            ./hosts/droid/srv1/default.nix
            ./hosts/droid/shared.nix
          ];
        };
        droid-srv2 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
            ./hosts/droid/srv2/default.nix
            ./hosts/droid/shared.nix
          ];
        };
        droid-srv3 = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [
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
      nixosConfigurations = {
        elitedesk = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          system = "x86_64-linux";
          modules = [
            ./hosts/linux/elitedesk
            ./hosts/shared.nix
            ./hosts/linux/shared.nix
          ];
        };
        g7 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          system = "x86_64-linux";
          modules = [
            ./hosts/linux/g7
            ./hosts/shared.nix
            ./hosts/linux/shared.nix
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

        droid-srv1 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-linux";
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
            system = "aarch64-linux";
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
            system = "aarch64-linux";
            config.allowUnFree = true;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home/droid.nix
          ];
        };

        elitedesk= home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnFree = true;
            overlays = [
              inputs.hyprpanel.overlay
            ];
          };
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home-manager/default.nix
            ./home/linux-desktop.nix
            ./home/linux.nix
          ];
        };
        g7 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnFree = true;
            overlays = [
              inputs.hyprpanel.overlay
            ];
          };
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
            ./home-manager/default.nix
            ./home/linux-desktop.nix
            ./home/linux.nix
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
      };
    };
}
