sudo nixos-rebuild switch --flake .#g7
nix run  --extra-experimental-features nix-command  nixpkgs#home-manager -- switch --flake .#g7