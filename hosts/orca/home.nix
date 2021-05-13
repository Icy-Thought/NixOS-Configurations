{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../../home.nix

    # Packages
    ../../nixpkgs/desktop.nix
    ../../nixpkgs/gnome.nix
    ../../nixpkgs/editor.nix
    ../../nixpkgs/nix-utils.nix
    ../.../nixpkgs/applications.nix
    ../../nixpkgs/utils.nix
    ../../nixpkgs/git.nix
    ../../nixpkgs/tui.nix
  ];

}
