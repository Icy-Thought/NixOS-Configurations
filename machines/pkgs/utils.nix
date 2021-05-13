{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    any-nix-shell                                       # Fish/ZSH support for nix-shell.
    gnupg                                               # Encrypt/Decrypt software.
    wget                                               # Downloading files from URL in terminal.
    unzip                                              # Enable unzipping files.
    unrar                                              # Enable extracting files from rar files.
    xclip                                              # Copy/Paste in XOrg terminal.
    wl-clipboard                                       # Copy/Paste in wayland terminal.
    gnumake                                            # Controls the generation of executable files.
    ffmpeg                                             # Library + Programs for management of multimedia files and streams.
    fish                                               # Shell with better defaults.
    pwgen                                              # Password generator.
    ripgrep                                            # faster grep.
    skim                                               # faster fzf.
    exa                                                # better ls.
    fd                                                 # faster find.
    pv                                                 # Progress-bar for mv/cp.
    iwd                                                # WPA_Supplicant alternative.
    zstd                                               # Undo-fu-session/undo-tree-compression.
    imagemagick                                        # LaTeX image export.
  ];
}
