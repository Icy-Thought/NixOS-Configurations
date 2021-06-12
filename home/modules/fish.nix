{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ../config/fish/config.fish;
    shellAbbrs = {

      # General
      ls     = "exa -l";
      lsa    = "exa -la";
      ytdl   = "youtube-dl";

      # Application-related
      temacs = "emacsclient -t";
      emacs  = "emacsclient -c";
      zoom   = "firejail zoom";

      # NixOS
      nixify = "dconf dump / | dconf2nix > ~/git/NixOS-Configurations/home/modules/dconf.nix";

      # Doom Emacs
      doupg = "doom sync && doom upgrade";
      doprg = "doom purge";

      # Fish
      fshcfg = "nvim ~/.config/fish/config.fish";
      bat0   = "upower -i /org/freedesktop/UPower/devices/battery_BAT0";
      
      # Git
      g   = "git";
      gc  = "git clone";
      ga  = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      gps = "git push";
      gpl = "git pull";
      gs  = "git status";
      
      # VPN
      wup = "wg-quick up Akkadian_VPN";
      wud = "wg-quick down Akkadian_VPN";
    };
  };

  home.packages = with pkgs; [
    starship                                    # Minimal prompt for fish/zsh/bash shell.
  ];

}
