{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    hydra-check
    nix-prefetch-github
    nixpkgs-review
    nix-top
    nixpkgs-fmt
  ];
}
