sudo nixos-rebuild switch --flake .#mbp-nixos
rm ~/.config/hyprpanel/config.json.backup
nix run  --extra-experimental-features nix-command  nixpkgs#home-manager -- switch -b backup --flake .#mbp-nixos
