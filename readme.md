# nix-config

> [!IMPORTANT]
> This nix config is unstable!

My personal dotfiles for MacOS/Linux/Android(nix-on-droid) written by Nix.

# setup for Android device (nix on droid)
```
nix shell nixpkgs#git
git clone <THIS_REPO>
cd nix-config
nix-on-droid switch --flake .#droid-srv1
nix run nixpkgs#home-manager -- switch --flake .#android-srv1
```
# setup for MacOS
```
nix run nixpkgs#home-manager -- switch --flake .#darwin-mac1
nix run nix-darwin -- switch --flake .#darwin-mac1
```
