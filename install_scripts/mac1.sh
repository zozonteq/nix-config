#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake .#darwin-mac1
nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake .#darwin-mac1
