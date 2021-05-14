{ pkgs, ... }:
{
  home.packages = with pkgs; [
    any-nix-shell                                      # Fish/ZSH support for nix-shell.
    uutils-coreutils                                   # Rust Rewrite of GNU-coreutils.
    gnupg                                              # Encrypt/Decrypt software.
    wget                                               # Downloading files from URL in terminal.
    unzip                                              # Enable unzipping files.
    unrar                                              # Enable extracting files from rar files.
    xclip                                              # Copy/Paste in XOrg terminal.
    wl-clipboard                                       # Copy/Paste in wayland terminal.
    gnumake                                            # Controls the generation of executable files.
    ffmpeg                                             # Library + Programs for management of multimedia files and streams.
    pwgen                                              # Password generator.
    ripgrep                                            # faster grep.
    skim                                               # faster fzf.
    exa                                                # better ls.
    fd                                                 # faster find.
    pv                                                 # Progress-bar for mv/cp.
    upower                                             # D-Bus service for power management.
    zstd                                               # Undo-fu-session/undo-tree-compression.
    imagemagick                                        # LaTeX image export.
    winetricks                                         # Install required DLL to escape exe trouble.
    tree-sitter                                        # Parser generator + incremental parsing lib.
    starship                                           # Minimal + customizable prompt.
  ];
}
