{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:NotAShelf/nvf";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    nix-darwin,
    nvf,
    nixvim,
    ...
  }: {
    darwinConfigurations = {
      mbp2016 = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [./conf/mbp2016-darwin.nix];
      };
      mba2023 = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        module = [./conf/mbp2016-darwin.nix];
      };
    };
    homeConfigurations = {
      mba2023 = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnFree = true;
        };
        modules = [
          nixvim.homeManagerModules.default
          nvf.homeManagerModules.default
          ./conf/mbp2016-home.nix
        ];
      };
      mbp2016 = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          config.allowUnFree = true;
        };
        modules = [
          nixvim.homeManagerModules.default
          nvf.homeManagerModules.default
          ./conf/mbp2016-home.nix
        ];
      };
    };
  };
}
