{ pkgs, ... }:
{
  imports = [
    # Configurations
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/alacritty.nix
    ../modules/emacs.nix
    ../modules/neovim.nix
    ../modules/tmux.nix
    # ../modules/gnome.nix
    # ../modules/mpd.nix
    # ../modules/ncmpcpp.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;  
    };
  }; 

  programs = {
    home-manager.enable = true;
    man.enable   = true;
    info.enable  = true;
    adb.enable   = true;
    dconf.enable = true;
  };

  # Set nixpkgs options (for home-manager installed packages only).
  fonts.fontconfig.enable = true;

  # xdg.portal.enable = true;

}
