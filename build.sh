#!/bin/bash
nix run nixpkgs#home-manager -- switch --flake .#mbp2016
nix run nix-darwin -- switch --flake .#mbp2016
