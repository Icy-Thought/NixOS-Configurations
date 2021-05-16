{ config, pkgs, inputs, ... }:
{
  imports = [
    ./home-apps.nix
    ./fish.nix
    ./alacritty.nix
    ./emacs.nix
    ./neovim.nix
    ./zathura.nix
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

    git = {
      enable = true;
      userName = "Icy_Thought";
      userEmail = "gilganyx@gmail.com";
      extraConfig.github.user = "Icy_thought";
      # extraConfig.core.excludesfile = builtins.toString ./gitignore_global;
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

  };

  # gtk = {
  #     enable = true;
  #     theme = {
  #       package = pkgs.arc-theme;
  #       name = "Arc-Dark";
  #     };
  #     iconTheme = {
  #       package = pkgs.paper-icon-theme;
  #       name = "Paper";
  #     };
  #     # Give Termite some internal spacing.
  #     gtk3.extraCss = ".termite {padding: 20px;}";
  # };

  # Set nixpkgs options (for home-manager installed packages only).
  fonts.fontconfig.enable = true;

  # xdg.portal.enable = true;

}
