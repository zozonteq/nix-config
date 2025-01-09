#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake .#darwin-mac2 -b backup
nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake .#darwin-mac2
