#!/bin/bash
nix-on-droid switch --flake .#droid-srv1
nix run nixpkgs#home-manager -- switch --flake .#droid-srv1
