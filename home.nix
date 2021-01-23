{ config, pkgs, ... }:
{
  imports = [
    ./extras
    ./packages
  ];

  nixpkgs = {
    overlays = [
      (import ./overlays/firefox-overlay.nix)
      (import ./overlays/rust-overlay.nix)
      (import ./overlays/neovim.nix)
    ];

    config = {
      allowUnfree = true;  
    };
  }; 

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Set nixpkgs options (for home-manager installed packages only).
  fonts.fontconfig.enable = true;

  # Enable documentation.
  programs = {
    man.enable      = true;
    info.enable     = true;
  };

  # xdg.portal.enable = true;

}
