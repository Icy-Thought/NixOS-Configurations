{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  imports = [
    ../../home/home.nix
  ];
}
