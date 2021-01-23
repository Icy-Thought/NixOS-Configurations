{ config, lib, pkgs, ... }:

{
  # Import configurations defined withing sub-categories.
  imports = [
    ../../home.nix
    ../packages2x/gnomize.nix
  ];

}
