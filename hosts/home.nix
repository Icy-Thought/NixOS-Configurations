{ config, pkgs, ... }:
{
  imports = [
    # Configurations
    ../nixpkgs/modules/fish.nix
    ../nixpkgs/modules/git.nix
    ../nixpkgs/modules/alacritty.nix
    ../nixpkgs/modules/emacs.nix
    ../nixpkgs/modules/neovim.nix
    ../nixpkgs/modules/tmux.nix
    ../nixpkgs/modules/mpd.nix
    ../nixpkgs/modules/ncmpcpp.nix
  ];

  nixpkgs = {
    overlays = [
      (import ../overlays/firefox-overlay.nix)
      (import ../overlays/rust-overlay.nix)
      (import ../overlays/neovim.nix)
    ];

    config = {
      allowUnfree = true;  
    };
  }; 

  programs = {
    home-manager.enable = true;
    man.enable   = true;
    info.enable  = true;
    adb.enable   = true;
  };

  # Set nixpkgs options (for home-manager installed packages only).
  fonts.fontconfig.enable = true;

  # xdg.portal.enable = true;

}
