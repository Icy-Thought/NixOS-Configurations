{ config, pkgs, inputs, ... }:
{
  imports = [
    ./home-apps.nix
    ./modules/fish.nix
    ./modules/alacritty.nix
    ./modules/emacs.nix
    ./modules/neovim.nix
    ./modules/git.nix
    # ./modules/gnome.nix
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

  i18n.inputMethod = {
    enabled = "ibus";
    # ibus.engines = with pkgs.ibus-engines; [ anthy hangul mozc ];
  };

}
