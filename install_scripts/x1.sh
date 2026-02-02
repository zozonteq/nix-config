sudo nixos-rebuild switch --flake .#x1
rm ~/.config/hyprpanel/config.json.backup
nix run  --extra-experimental-features nix-command  nixpkgs#home-manager -- switch -b backup --flake .#omen
