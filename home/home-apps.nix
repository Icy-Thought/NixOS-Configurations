{ config, lib, pkgs, inputs, ... }:

let
  defaultPkgs = with pkgs; [
    zathura                                             # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                           # Rust-based Terminal.
    brave                                               # Chromium-based browser.
    latest.firefox-nightly-bin                          # Latest Firefox edition.
    latest.firefox-beta-bin                             # Firefox + dev-tools enabled.
    openrazer-daemon                                    # Control your razer hardware.
    # Polychromatic                                     # GUI to control OpenRazer.
    mpv                                                 # Media Player.
    celluloid                                           # GTK frontend for MPV.
    gimp                                                # The better Photoshop alternative.
    inkscape                                            # The better Illustrator alternative.
    blender                                             # 3D Creation/Animation.
    libreoffice                                         # The better office alternative suit.
    obs-studio                                          # Streaming/Recording.
    qalculate-gtk                                       # Scientific calculator.
    discord-canary                                      # Latest Discord client.
    tdesktop                                            # Telegram Desktop.
    signal-desktop                                      # More secure WhatsApp alternative.
    fractal                                             # Rust-based matrix client.
    easytag                                             # M3U Editor.
    transmission-gtk                                    # BitTorrent Client.
    freetube                                            # FOSS private YT app.
    foliate                                             # Minimal E-Book reader.
    zoom-us                                             # Conferencing application..
    heimdall-gui                                        # Suit to flash Android firmware.
    anki                                                # Spaced repetition flashcard.
  ];

  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy                                       # Colored git diff.
    git-crypt                                           # git file encryption.
    hub                                                 # github TUI client.
    tig                                                 # diff and commit view.
  ];

  editorPkgs = with pkgs; [
    gnuplot                                             # Plotting through programming.
    neovim-nightly                                      # Neovim + Lua support.
    tmux                                                # Terminal multiplexer.
  ];

  gnomePkgs = with pkgs; [
    gnome.polari                                        # Gnome IRC client.
    gnome.gnome-boxes                                   # Remove/Virtual system management.
    gnome.gnome-tweak-tool                              # Advance Gnome setting control.
    chrome-gnome-shell                                  # Gnome Shell Integration for Chrome.
    # pop-os-shell                                      # Gnome Tiling Manager.
    # gnome.geary                                         # Gnome 2nd E-Mail client.
    # gnomeExtensions.appindicator                        # Enables systray icons.
    # gnomeExtensions.gsconnect                           # KDE Connect for Gnome.
  ];

  langPkgs = with pkgs; [
    rust-bin.nightly.latest.default                     # Latest Rust compiler.
    rust-analyzer                                       # Rust-Analyzer for better rust completion.
    languagetool                                        # Proofreading (grammar checker) for several languages.
    ccls                                                # C/C++ language server powered by clang.
    cmake                                               # Automated build automation, testing & packaging software.
    texlive.combined.scheme-medium                      # LaTeX support.
    nodePackages.npm                                    # JS package manager.
    nodePackages.javascript-typescript-langserver       # Javascript support.
    hugo                                                # Fast + Modern static web-engine.
  ];

  spellPkgs = with pkgs; [
    aspellDicts.en                                      # en_US aspell dictionary.
    aspellDicts.sv                                      # sv_SE aspell-dictionary.
    hunspellDicts.sv_SE                                 # sv_SE hunspell-dictionary.
    hunspellDicts.en_US                                 # en_US dictionary.
    ibus                                                # Support for CJK language input.
    ibus-engines.libpinyin                              # IBus pinyin support.
    libpinyin                                           # Pinyin input.
  ];

  nixPkgs = with pkgs; [
    hydra-check                                         # Checks hydra for build status of a package.
    nix-prefetch-github                                 # Prefetch from GH.
    nixpkgs-review                                      # Review nixpkgs PR.
    nix-top                                             # Tracks nix builds.
    nixpkgs-fmt                                         # Nix code formatter for nixpkgs.
  ];
   
  utilsPkgs = with pkgs; [
    # uutils-coreutils                                    # Rust Rewrite of GNU-coreutils.
    any-nix-shell                                       # Fish/ZSH support for nix-shell.
    pciutils                                            # lspci, setpci & update-pciids support.
    wireguard                                           # Wireguard tools.
    gnupg                                               # Encrypt/Decrypt software.
    wget                                                # Downloading files from URL in terminal.
    unzip                                               # Enable unzipping files.
    unrar                                               # Enable extracting files from rar files.
    xclip                                               # Copy/Paste in XOrg terminal.
    wl-clipboard                                        # Copy/Paste in wayland terminal.
    gnumake                                             # Controls the generation of executable files.
    ffmpeg                                              # Library + Programs for management of multimedia files and streams.
    pv                                                  # Progress-bar for mv/cp.
    fd                                                  # faster find.
    exa                                                 # better ls.
    ripgrep                                             # faster grep.
    skim                                                # faster fzf.
    upower                                              # D-Bus service for power management.
    zstd                                                # Undo-fu-session/undo-tree-compression.
    dconf2nix                                           # Nixify your dconf-settings.
    pwgen                                               # Password generator.
    imagemagick                                         # LaTeX image export.
    winetricks                                          # Install required DLL to escape exe trouble.
    tree-sitter                                         # Parser generator + incremental parsing lib.
    firejail                                            # Namespace-based sandboxing tool.
    starship                                            # Minimal + customizable prompt.
  ];

  tuiPkgs = with pkgs; [
    nnn                                                 # TUI file manager.
    htop                                                # Monitor current processes.
    neofetch                                            # Fetch system information.
    # mpd                                                 # Media player daemon.
    # ncmpcpp                                             # TUI music player.
    # spotify-tui                                         # TUI for premium Spotify users.
    # speedtest-cli                                       # TUI Speedtest.
    youtube-dl                                          # YouTube media downloader.
  ];

  gamingPkgs = with pkgs; [
    wine-staging                                        # Latest Wine package.
    steam                                               # Gaming platform.
    lutris                                              # WINE gaming platform.
    osu-lazer                                           # FOSS Rythm game!
  ];

in {
  home.packages = builtins.concatLists [
    defaultPkgs 
    gitPkgs 
    editorPkgs 
    gnomePkgs 
    langPkgs 
    spellPkgs 
    nixPkgs 
    utilsPkgs 
    tuiPkgs 
    gamingPkgs
  ];
}
