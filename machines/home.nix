{ config, pkgs, ... }:
let
  defaultPkgs = with pkgs; [
    any-nix-shell
    zathura
    alacritty
    brave
    latest.firefox-nightly-bin
    gimp
    inkscape
    libreoffice
    gnupg
    steam
    lutris
    osu-lazer
    obs-studio
    qalculate-gtk
    signal-desktop
    fractal
    easytag

    # Gnome3
    # gnome3.gnome-tweaks
    # gnomeExtensions.gsconnect
    # gnomeExtensions.caffeine
  ];

   editorsPkgs = with pkgs; [
    # doom-emacs
    emacs
    gnuplot
    neovim
    tmux
   ];

  developmentPkgs = with pkgs; [
    latest.rustChannels.nightly.rust
    clang
    cmake
  ];

  utilityPkgs = with pkgs; [
     coreutils
     less
     wget
     unzip
     unrar
     neofetch
     htop
     xclip
     wl-clipboard
     curlFull
     diffutils
     findutils
     gnumake
     ncmpcpp
     ffmpeg
     spotify-tui
     speedtest-cli
     youtube-dl
     fish
     pwgen
     mpd
     nnn
     ripgrep
     skim
     exa
     fd
     pv
  ];

  environmentPkgs = with pkgs; [
    wayland
    networkmanagerapplet
    iwd
    dconf
    aspellDicts.en
    aspellDicts.sv
    hunspellDicts.sv_SE
    hunspellDicts.en_US
    ibus
    ibus-engines.libpinyin
    libpinyin
  ];

  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy
    git-crpt
    hub
    tig
  ];

in
{
  imports = [
    # Configurations
    ../extras/git/default.nix
    ../extras/fish/default.nix
    ../extras/alacritty/default.nix
    ../extras/tmux/default.nix
    ../extras/neovim/default.nix
    ../extras/emacs/default.nix
    ../extras/mpd/default.nix
    ../extras/ncmpcpp/default.nix
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
