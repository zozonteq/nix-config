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
  };
  outputs = {
    nixpkgs,
    home-manager,
    nix-darwin,
    nvf,
    ...
  }: {
    darwinConfigurations = {
      mbp2016 = nix-darwin.lib.darwinSystem{
        system = "x86_64-darwin";
        modules = [ ./conf/mbp2016-darwin.nix ];
      };
    };
    homeConfigurations = {
      mbp2016 = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          config.allowUnFree = true;
        };
        modules = [
          nvf.homeManagerModules.default
          ./conf/mbp2016-home.nix
        ];
      };
    };
  };
}
