#! /usr/bin/env bash

# Shows the output of every command
set +x

# Switch to the unstable channel
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

# Nix configuration
sudo cp NixOS-Configurations/machines/nixos/configuration.nix /etc/nixos/
sudo nixos-rebuild switch --upgrade

# Home manager
mkdir -p $HOME/.config/nixpkgs/
ln -s NixOS-Configurations/hosts/wukong/home.nix $HOME/.config/nixpkgs/

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
home-manager switch

# Doom-emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
$HOME/.emacs.d/bin/doom install
