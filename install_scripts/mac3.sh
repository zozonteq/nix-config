#!/bin/bash
nix run --extra-experimental-features 'nix-command flakes' nixpkgs#home-manager -- switch --flake .#darwin-mac2 -b backup
nix run --extra-experimental-features 'nix-command flakes' nixpkgs#darwin-rebuild -- switch --flake .#darwin-mac2
