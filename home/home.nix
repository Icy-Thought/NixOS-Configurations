{ config, pkgs, inputs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in 
{
  imports = [
    ./hm-packages.nix
    ./modules/fish.nix
    ./modules/alacritty.nix
    ./modules/emacs.nix
    ./modules/neovim.nix
    ./modules/git.nix
    # ./modules/gnome.nix
    # ./modules/dconf.nix                       <-- find more appropriate way to enable this setting.
    ./modules/zathura.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      };

    overlays = [
      (import ../overlays/firefox-overlay.nix)
      (import ../overlays/rust-overlay.nix)
      (import ../overlays/neovim-nightly-overlay.nix)
      # (import ../overlays/emacs-overlay.nix)
    ];

  };

  programs = {
    home-manager = {
      enable = true;
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      extraConfig = builtins.readFile ./config/tmux/tmux.conf;
      escapeTime = 0;
      keyMode = "vi";
      shortcut = "a";
      terminal = "screen-256color";
    };

    direnv = {
      enable = true;
      enableFishIntegration = true;
      enableNixDirenvIntegration = true;
    };

  };
 
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

}
