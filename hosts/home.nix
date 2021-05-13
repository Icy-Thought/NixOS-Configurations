{ config, pkgs, ... }:
{
  imports = [
    # Configurations
    ../../modules/fish.nix
    ../../modules/git.nix
    ../../modules/alacritty.nix
    ../../modules/emacs.nix
    ../../modules/neovim.nix
    ../../modules/tmux.nix
    ../../modules/mpd.nix
    ../../modules/ncmpcpp.nix
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
