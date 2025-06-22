{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
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

  outputs = { self, nixpkgs, home-manager, nixvim, nix-on-droid, nix-darwin, ... }@inputs:
    let
      # 共通設定をインポート
      common = import ./lib/common.nix { };

      # 共通設定関数
      mkNixOnDroidConfig = hostName: modules:
        nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = common.systems.aarch64-linux; };
          modules = modules;
        };

      mkDarwinConfig = hostName: system: modules:
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = modules;
        };

      mkNixOSConfig = hostName: system: modules:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = modules;
        };

      mkHomeConfig = hostName: system: extraModules: extraPkgsConfig: extraSpecialArgs:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnFree = true;
            overlays = extraPkgsConfig.overlays or [];
          };
          extraSpecialArgs = extraSpecialArgs;
          modules = [
            nixvim.homeManagerModules.default
            ./home/shared.nix
          ] ++ extraModules;
        };

      # 共通モジュール
      commonLinuxModules = [
        ./hosts/shared.nix
        ./hosts/linux/shared.nix
      ];

      commonDarwinModules = [
        ./hosts/darwin/shared.nix
      ];

      # デスクトップLinux用の追加設定
      desktopLinuxPkgsConfig = {
        overlays = [ inputs.hyprpanel.overlay ];
      };

      desktopLinuxSpecialArgs = { inherit inputs; };

      desktopLinuxModules = [
        ./home-manager/default.nix
        ./home/linux-desktop.nix
        ./home/linux.nix
      ];

      serverLinuxModules = [
        ./home/linux.nix
      ];

      darwinModules = [
        ./home/darwin.nix
      ];

      droidModules = [
        ./home/droid.nix
      ];

    in {
      # nix-on-droid設定
      nixOnDroidConfigurations = {
        droid-srv1 = mkNixOnDroidConfig "droid-srv1" [
          ./hosts/droid/srv1/default.nix
          ./hosts/droid/shared.nix
        ];
        droid-srv2 = mkNixOnDroidConfig "droid-srv2" [
          ./hosts/droid/srv2/default.nix
          ./hosts/droid/shared.nix
        ];
        droid-srv3 = mkNixOnDroidConfig "droid-srv3" [
          ./hosts/droid/srv3/default.nix
          ./hosts/droid/shared.nix
        ];
      };

      # darwin設定
      darwinConfigurations = {
        darwin-mac1 = mkDarwinConfig "darwin-mac1" common.systems.x86_64-darwin (
          commonDarwinModules ++ [ ./hosts/darwin/mac1 ]
        );
        darwin-mac2 = mkDarwinConfig "darwin-mac2" common.systems.aarch64-darwin (
          commonDarwinModules ++ [ ./hosts/darwin/mac2 ]
        );
      };

      # nixos設定
      nixosConfigurations = {
        elitedesk = mkNixOSConfig "elitedesk" common.systems.x86_64-linux (
          [ ./hosts/linux/elitedesk ] ++ commonLinuxModules
        );
        g7 = mkNixOSConfig "g7" common.systems.x86_64-linux (
          [ ./hosts/linux/g7 ] ++ commonLinuxModules
        );
        omen = mkNixOSConfig "omen" common.systems.x86_64-linux (
          [ ./hosts/linux/omen ] ++ commonLinuxModules
        );
      };

      # home-manager設定
      homeConfigurations = {
        # Darwin設定
        darwin-mac1 = mkHomeConfig "darwin-mac1" common.systems.x86_64-darwin darwinModules {} {};
        darwin-mac2 = mkHomeConfig "darwin-mac2" common.systems.aarch64-darwin darwinModules {} {};

        # Droid設定
        droid-srv1 = mkHomeConfig "droid-srv1" common.systems.aarch64-linux droidModules {} {};
        droid-srv2 = mkHomeConfig "droid-srv2" common.systems.aarch64-linux droidModules {} {};
        droid-srv3 = mkHomeConfig "droid-srv3" common.systems.aarch64-linux droidModules {} {};

        # デスクトップLinux設定
        elitedesk = mkHomeConfig "elitedesk" common.systems.x86_64-linux desktopLinuxModules desktopLinuxPkgsConfig desktopLinuxSpecialArgs;
        g7 = mkHomeConfig "g7" common.systems.x86_64-linux desktopLinuxModules desktopLinuxPkgsConfig desktopLinuxSpecialArgs;
        omen = mkHomeConfig "omen" common.systems.x86_64-linux desktopLinuxModules desktopLinuxPkgsConfig desktopLinuxSpecialArgs;

        # サーバーLinux設定
        linux-server1 = mkHomeConfig "linux-server1" common.systems.aarch64-darwin serverLinuxModules {} {};
      };
    };
}
