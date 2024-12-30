{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault "g7";
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./hardware.nix
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    servers = {
      proxy = {
        enable = true;
        openFirewall = true;
        package = pkgs.velocityServers.velocity;
        files = {
          "velocity.toml".value = {
            config-version = "2.7";
            bind = "0.0.0.0:25565";
            motd = "Proxy server";
            show-max-players = 50;
            online-mode = true;
            force-key-authentication = false;
            player-info-forwarding-mode = "modern";
            servers = {
              lobby = "0.0.0.0:30066";
              try = [ "lobby" ];
            };
            forced-hosts = { };
          };
        };
        symlinks = {
          "forwarding.secret" = pkgs.writeTextFile {
            name = "forwarding.secret";
            text = "secret";
          };
        };
      };
      lobby = {
        enable = true;
        openFirewall = true;
        restart = "always";
        serverProperties = {
          motd = "A Lobby server";
          online-mode = false;
          server-port = 30066;
          enforce-secure-profile = false;
        };
        package = pkgs.paperServers.paper-1_19_4;
        symlinks = {
          "plugins/ViaVersion.jar" = builtins.fetchurl {
            url = "https://github.com/ViaVersion/ViaVersion/releases/download/5.2.0/ViaVersion-5.2.0.jar";
            sha256 = "5483466f4aa960b687f89178e93918c27aa7fa9d06ffbc4995729ce0aa5584d6";
            name = "ViaVersion.jar";
          };
          "plugins/SkinRestorer.jar" = builtins.fetchurl {
            url = "https://github.com/SkinsRestorer/SkinsRestorer/releases/download/15.5.1/SkinsRestorer.jar";
            sha256 = "9390a8add16de2fbbdb49f6cb9677ce69cc9572d96c3077290a0f108519323b5";
            name = "SkinRestorer.jar";
          };
        };
        files = {
          "config/paper-global.yml".value = {
            _version = 28;
            proxies = {
              proxy-protocol = false;
              velocity = {
                enabled = true;
                online-mode = false;
                secret = "secret";
              };
            };
          };
        };
      };
    };
  };
}
