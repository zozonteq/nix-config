#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake .#mba2023
nix run nix-darwin -- switch --flake .#mba2023
