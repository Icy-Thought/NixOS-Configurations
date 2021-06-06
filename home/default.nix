{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hm-packages.nix
    ./modules/git.nix
    ./modules/fish.nix
    ./modules/alacritty.nix
    ./modules/emacs.nix
    ./modules/neovim.nix
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
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        ls = "ls --color=auto";
      };
      bashrcExtra = ''
        eval "$(starship init bash)"
      '';
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
