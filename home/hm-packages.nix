{ config, lib, pkgs, inputs, ... }:

let
  defaultPkgs = with pkgs; [
    wl-clipboard                                                  # Wayland c-p/c-v.
    zathura                                                       # Minimal PDF/EPUB/DJUV/.. reader.
    latest.firefox-nightly-bin                                    # Latest Firefox edition.
    brave                                                         # Chromium-based browser.
    # Polychromatic                                               # GUI to control OpenRazer.
    anki                                                          # Spaced repetition flashcard.
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
    tmux                                                          # Terminal multiplexer.
  ];

  devPkgs = with pkgs; [
    rust-bin.nightly.latest.default                               # Latest Rust compiler.
    languagetool                                                  # Proofreading for several languages.
    rust-analyzer                                                 # Rust-Analyzer for better rust completion.
    sumneko-lua-language-server                                   # Lua language server.
    gcc11                                                         # GNU Compiler Collection.
    ccls                                                          # C/C++ language server powered by clang.
    gnumake                                                       # Controls the generation of executable files.
    cmake                                                         # Build automation, testing & packaging.
    nodejs-16_x                                                   # I/O framwork for JS v8.
    openssl                                                       # Library for SSL and TLS protocols.
    sqlite                                                        # Serverless SQL database.
    jq                                                            # Lightweight JSON processor.
    xsv                                                           # Fast CSV toolkit (Rust).
    python39                                                      # Python Programming language.
    pipenv                                                        # Python Development workflow for humans.
    graphviz                                                      # Graph visualization tools.
    texlive.combined.scheme-medium                                # LaTeX support.
    hugo                                                          # Fast + Modern static web-engine.
  ];

  lanservPkgs = with pkgs.nodePackages ; [
    # javascript-typescript-langserver                             # JavaScript/TypeScript.
    pyright                                                       # Python.
    typescript-language-server                                    # TypeScript.
    bash-language-server                                          # Bash.
  ];
  
  pyPkgs = with pkgs.python39Packages; [
    black                                                         # Uncompromising Python code formatter.
    isort                                                         # Sort Py imports.
    pyflakes                                                      # Check Py for errors.
    nose-timer                                                    # A timer for nosetests.
    nose-exclude                                                  # Exclude specific dirs from nosetests runs.
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
    # uutils-coreutils                                            # Rust Rewrite of GNU-coreutils.
    wget                                                          # Downloading files from URL in terminal.
    unzip                                                         # Enable unzipping files.
    ffmpeg                                                        # Management of multimedia files and streams.
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
    youtube-dl                                                    # YouTube media downloader.
    # mpd                                                         # Media player daemon.
    # ncmpcpp                                                     # TUI music player.
    # spotify-tui                                                 # TUI for premium Spotify users.
    # speedtest-cli                                               # TUI Speedtest.
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
    devPkgs 
    lanservPkgs 
    pyPkgs
    spellPkgs 
    nixPkgs 
    utilsPkgs 
    tuiPkgs 
    gamingPkgs
  ];

}
