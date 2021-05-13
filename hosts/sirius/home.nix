{ config, lib, pkgs, ... }:

{
  imports = [
    ../home.nix

    # Packages
    ../../nixpkgs/desktop.nix
    ../../nixpkgs/gnome.nix
    ../../nixpkgs/editor.nix
    ../../nixpkgs/development.nix
    ../../nixpkgs/languages.nix
    ../../nixpkgs/applications.nix
    ../../nixpkgs/gaming.nix
    ../../nixpkgs/nix-utils.nix
    ../../nixpkgs/utils.nix
    ../../nixpkgs/git.nix
    ../../nixpkgs/tui.nix
    
  ];

}
