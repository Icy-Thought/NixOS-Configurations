{ config, lib, pkgs, inputs, ... }:

let
  defaultPkgs = with pkgs; [
    zathura                                                       # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                                     # Rust-based Terminal.
    brave                                                         # Chromium-based browser.
    latest.firefox-nightly-bin                                    # Latest Firefox edition.
    # latest.firefox-beta-bin                                       # Firefox + dev-tools enabled.
    openrazer-daemon                                              # Control your razer hardware.
    # Polychromatic                                               # GUI to control OpenRazer.
    anki                                                          # Spaced repetition flashcard.
    mpv                                                           # Media Player.
    celluloid                                                     # GTK frontend for MPV.
    gimp                                                          # The better Photoshop alternative.
    inkscape                                                      # The better Illustrator alternative.
    blender                                                       # 3D Creation/Animation.
    libreoffice                                                   # The better office alternative suit.
    obs-studio                                                    # Streaming/Recording.
    qalculate-gtk                                                 # Scientific calculator.
    discord                                                       # Latest Discord client.
    tdesktop                                                      # Telegram Desktop.
    signal-desktop                                                # More secure WhatsApp alternative.
    fractal                                                       # Rust-based matrix client.
    easytag                                                       # M3U Editor.
    transmission-gtk                                              # BitTorrent Client.
    freetube                                                      # FOSS private YT app.
    glade                                                         # UI designer for GTK Applications.
    cawbird                                                       # GTK Twitter client.
    foliate                                                       # Minimal E-Book reader.
    zoom-us                                                       # Conferencing application..
    heimdall-gui                                                  # Suit to flash Android firmware.
    gsmartcontrol                                                 # Hard disk drive health inspection tool.
  ];

  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy                                                 # Colored git diff.
    git-crypt                                                     # git file encryption.
    tig                                                           # diff and commit view.
  ];

  editorPkgs = with pkgs; [
    gnuplot                                                       # Plotting through programming.
    neovim-nightly                                                # Neovim + Lua support.
    tmux                                                          # Terminal multiplexer.
  ];

  gappsPkgs= with pkgs.gnome; [
    geary                                                         # Gnome 2nd E-Mail client.
    zenity                                                        # Display Dialogs.
    polari                                                        # Gnome IRC client.
    meld                                                          # Visual merge/diff tool.
    gnome-boxes                                                   # Remove/Virtual system management.
    gnome-dictionary                                              # To look up mispellings.
    gnome-disk-utility                                            # Manage your disks through gnome.
    gnome-tweak-tool                                              # Advance Gnome setting control.
    gnome-software                                                # Gnome software store.
    gnome-packagekit                                              # Allows installing software on Gnome.
  ];

  gextPkgs = with pkgs; [
    chrome-gnome-shell                                            # Gnome Shell integration for Chrome.
    # gnomeExtensions.pop-os-shell                                # Gnome Tiling Manager.
  ];

  devPkgs = with pkgs; [
    rust-bin.nightly.latest.default                               # Latest Rust compiler.
    rust-analyzer                                                 # Rust-Analyzer for better rust completion.
    languagetool                                                  # Proofreading (grammar checker) for several languages.
    clang                                                         # C/C++ compiler.
    ccls                                                          # C/C++ language server powered by clang.
    gnumake                                                       # Controls the generation of executable files.
    cmake                                                         # Automated build automation, testing & packaging software.
    openssl                                                       # Library for SSL and TLS protocols.
    sqlite                                                        # Serverless SQL database.
    jq                                                            # Lightweight JSON processor.
    xsv                                                           # Fast CSV toolkit (Rust).
    python39                                                      # Python Programming language.
    pipenv                                                        # Python Development workflow for humans.
    graphviz                                                      # Graph visualization tools.
    texlive.combined.scheme-medium                                # LaTeX support.
    nodePackages.npm                                              # JS package manager.
    nodePackages.javascript-typescript-langserver                 # Javascript support.
    hugo                                                          # Fast + Modern static web-engine.
  ];
  
  pyPkgs = with pkgs.python39Packages; [
    black                                                         # Uncompromising Python code formatter.
    isort                                                         # Sort Py imports.
    pyflakes                                                      # Check Py for errors.
    nose-timer                                                    # A timer for nosetests.
    pytest                                                        # Py Test framework.
  ];                                                            
  
  spellPkgs = with pkgs; [
    aspell                                                        # Dictionary for spelling support.
    aspellDicts.en                                                # en_US aspell dictionary.
    aspellDicts.sv                                                # sv_SE aspell-dictionary.
    hunspellDicts.sv_SE                                           # sv_SE hunspell-dictionary.
    hunspellDicts.en_US                                           # en_US dictionary.
  ];

  nixPkgs = with pkgs; [
    any-nix-shell                                                 # Fish/ZSH support for nix-shell.
    nix-direnv                                                    # Fast nix-impl of direnv.
    hydra-check                                                   # Checks hydra for build status of a package.
    nix-prefetch-github                                           # Prefetch from GH.
    nixpkgs-review                                                # Review nixpkgs PR.
    nix-top                                                       # Tracks nix builds.
    nixfmt                                                        # Nix code formatter.
    nixpkgs-fmt                                                   # [...] -> for nixpkgs.
    lorri                                                         # Project's nix-env.
  ];

  utilsPkgs = with pkgs; [
    # uutils-coreutils                                              # Rust Rewrite of GNU-coreutils.
    moreutils                                                     # An extension to GNU utils.
    direnv                                                        # Shell extension to manage env.
    pciutils                                                      # lspci, setpci & update-pciids support.
    wireguard                                                     # Wireguard tools.
    gnupg                                                         # Encrypt/Decrypt software.
    firejail                                                      # Namespace-based sandboxing tool.
    wget                                                          # Downloading files from URL in terminal.
    unzip                                                         # Enable unzipping files.
    unrar                                                         # Enable extracting files from rar files.
    xclip                                                         # Copy/Paste in XOrg terminal.
    wl-clipboard                                                  # Copy/Paste in wayland terminal.
    ffmpeg                                                        # Library + Programs for management of multimedia files and streams.
    pv                                                            # Progress-bar for mv/cp.
    fd                                                            # faster find.
    exa                                                           # better ls.
    ripgrep                                                       # faster grep.
    skim                                                          # faster fzf.
    gh                                                            # Official GitHub client.
    upower                                                        # D-Bus service for power management.
    binutils                                                      # Tools for manipulating binaries.
    exiftool                                                      # Control file metadata.
    bustle                                                        # Draw sequence diagrams of D-Bus traffic.
    dfeet                                                         # D-Bus debugger.
    diffoscope                                                    # In-depth comparison tool.
    common-updater-scripts                                        # Common nix updating scripts????
    zstd                                                          # Undo-fu-session/undo-tree-compression.
    dconf2nix                                                     # Nixify your dconf-settings.
    pwgen                                                         # Password generator.
    imagemagick                                                   # LaTeX image export.
    winetricks                                                    # Install required DLL to escape exe trouble.
    tree-sitter                                                   # Parser generator + incremental parsing lib.
    ncdu                                                          # Dis analyzer through NCurses.
  ];

  tuiPkgs = with pkgs; [
    starship                                                      # Minimal + customizable prompt.
    nnn                                                           # TUI file manager.
    htop                                                          # Monitor current processes.
    neofetch                                                      # Fetch system information.
    # mpd                                                           # Media player daemon.
    # ncmpcpp                                                       # TUI music player.
    # spotify-tui                                                   # TUI for premium Spotify users.
    # speedtest-cli                                                 # TUI Speedtest.
    youtube-dl                                                    # YouTube media downloader.
  ];

  gamingPkgs = with pkgs; [
    wine-staging                                                  # Latest Wine package.
    steam                                                         # Gaming platform.
    lutris                                                        # WINE gaming platform.
    osu-lazer                                                     # FOSS Rythm game!
  ];

in {
  home.packages = builtins.concatLists [
    defaultPkgs 
    gitPkgs 
    editorPkgs 
    gappsPkgs 
    gextPkgs
    devPkgs 
    pyPkgs
    spellPkgs 
    nixPkgs 
    utilsPkgs 
    tuiPkgs 
    gamingPkgs
  ];
}