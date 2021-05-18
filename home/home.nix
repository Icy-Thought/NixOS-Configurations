{ config, pkgs, inputs, ... }:
{
  imports = [
    ./home-apps.nix
    ./fish.nix
    ./alacritty.nix
    ./emacs.nix
    ./neovim.nix
    ./git.nix
    # ./gnome.nix
    ./zathura.nix
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
      enableNixIntegration = true;
    };

  };

  # Set nixpkgs options (for home-manager installed packages only).
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  # xdg.portal = {
  #   enable = true;
  # };

}
