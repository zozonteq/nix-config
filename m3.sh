#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake .#darwin-mac2
#nix run nix-darwin -- switch --flake .#darwin-mac2
